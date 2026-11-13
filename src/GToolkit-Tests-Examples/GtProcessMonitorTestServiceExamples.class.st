"
I exemplify that {{gtClass:ProcessMonitorTestService}} keeps its `forkedProcesses` set consistent when several processes use it at the same time.

All examples of a class share one {{gtClass:TestExecutionEnvironment}} and therefore one {{gtClass:ProcessMonitorTestService}}. {{gtMethod:ProcessMonitorTestService>>#handleNewProcess:}} runs in the forking process, which is often a lower-priority worker, while {{gtMethod:ProcessMonitorTestService>>#cleanUpAfterTest}} runs in the example process after every example. Without synchronization, `forkedProcesses removeAll` (see {{gtMethod:WeakSet>>#initialize:}}) can run while another process is inside {{gtMethod:WeakSet>>#growTo:}}, after the new array was filled with the old empty-slot marker but before it was stored. The set then contains plain objects instead of processes, and {{gtMethod:ProcessMonitorTestService>>#runningProcesses}} or {{gtMethod:ProcessMonitorTestService>>#terminateRunningProcesses}} fail with `doesNotUnderstand: #isTerminated` or `#terminate`, or the adder never finds an empty slot.

{{gtExample:GtProcessMonitorTestServiceExamples>>#cleanUpWaitsForProcessGrowingForkedProcesses}} reproduces this deterministically: it steps an adder process with {{gtMethod:Process>>#step}} to exactly that point and runs the clean-up in a higher-priority process. With the fix (one `Mutex` guarding `forkedProcesses` and `testFailures`, applied as a Pharo patch by `load-patches.st` in `gtoolkit-maestro-rs`), the clean-up waits until the adder leaves the critical section. All step loops and waits are bounded, and helper processes are terminated in an ensure block.
"
Class {
	#name : #GtProcessMonitorTestServiceExamples,
	#superclass : #Object,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #'examples - race' }
GtProcessMonitorTestServiceExamples >> cleanUpWaitsForProcessGrowingForkedProcesses [
	"An adder process is stopped inside WeakSet>>#growTo:, right after the new array was created but before it was stored.
	A higher-priority process then cleans up the service. The clean-up must not corrupt forkedProcesses:
	the adder must finish, the clean-up must finish, and forkedProcesses must contain only processes."

	<gtExample>
	<return: #ProcessMonitorTestService>
	| service keptProcesses adder adderFailures cleanUp cleanUpDone stoppedInsideGrowTo adderFinished cleanUpTimedOut runningProcesses |
	service := ProcessMonitorTestService new.
	keptProcesses := OrderedCollection new.
	self fillForkedProcessesOf: service untilNextAddGrowsKeeping: keptProcesses.
	adderFailures := OrderedCollection new.
	adder := self
			newAdderFor: service
			keeping: keptProcesses
			failures: adderFailures.
	cleanUpDone := Semaphore new.
	[ stoppedInsideGrowTo := self
			step: adder
			untilInsideGrowToBeforeStoringArrayOf: service forkedProcesses.
	stoppedInsideGrowTo
		ifTrue: [ cleanUp := self forkHigherPriorityCleanUpOf: service signalling: cleanUpDone.
			adderFinished := self step: adder untilTerminatedWithin: self stepBudget.
			cleanUpTimedOut := cleanUpDone waitTimeoutMilliseconds: 1000 ] ]
		ensure: [ self terminateIfRunning: adder.
			self terminateIfRunning: cleanUp ].

	self
		assert: stoppedInsideGrowTo
		description: 'The adder did not reach WeakSet>>#growTo: after creating the new array'.
	self
		assert: adderFailures isEmpty
		description: [ 'Adding a process failed with ' , adderFailures first printString ].
	self
		assert: adderFinished
		description: 'The adder did not finish adding a process within the step budget (forkedProcesses is corrupted)'.
	self
		assert: cleanUpTimedOut not
		description: 'The clean-up process did not finish'.
	self
		assert: (service forkedProcesses asArray allSatisfy: [ :each | each isKindOf: Process ])
		description: 'forkedProcesses contains objects that are not processes'.
	runningProcesses := [ service runningProcesses ]
			on: Error
			do: [ :anError | anError ].
	self
		assert: (runningProcesses isKindOf: Collection)
		description: [ 'runningProcesses raised ' , runningProcesses printString ].
	self assert: keptProcesses notEmpty.

	^ service
]

{ #category : #'private - processes' }
GtProcessMonitorTestServiceExamples >> fillForkedProcessesOf: aService untilNextAddGrowsKeeping: aCollection [
	"Add new (not started) processes until adding one more process makes the WeakSet grow.
	aCollection keeps the processes alive, so that the weak set does not lose them."

	[ self isNextAddGrowing: aService forkedProcesses ]
		whileFalse: [ aService handleNewProcess: (aCollection add: [  ] newProcess) ]
]

{ #category : #'private - processes' }
GtProcessMonitorTestServiceExamples >> forkHigherPriorityCleanUpOf: aService signalling: aSemaphore [
	"Run ProcessMonitorTestService>>#cleanUpAfterTest in a process with a higher priority than the active process.
	It preempts the active process immediately: it either finishes, or waits for a process that is inside a critical section of aService.
	aSemaphore is signalled when the clean-up finishes."

	| aProcess |
	self assert: Processor activePriority < Processor highestPriority.
	aProcess := [ [ aService cleanUpAfterTest ] ensure: [ aSemaphore signal ] ]
			newProcess.
	aProcess priority: Processor activePriority + 1.
	aProcess name: 'ProcessMonitorTestService clean-up example'.
	aProcess resume.
	^ aProcess
]

{ #category : #'private - processes' }
GtProcessMonitorTestServiceExamples >> isNextAddGrowing: aWeakSet [
	| aProbe |
	aProbe := aWeakSet copy.
	aProbe add: Object new.
	^ (aProbe instVarNamed: #array) size > (aWeakSet instVarNamed: #array) size
]

{ #category : #'private - processes' }
GtProcessMonitorTestServiceExamples >> isProcess: aProcess insideGrowToBeforeStoringArrayOf: aWeakSet [
	"Answer true if aProcess is suspended in WeakSet>>#growTo: of aWeakSet
	with the new array on the stack, before the array is stored in the set"

	| aContext |
	aContext := aProcess suspendedContext.
	aContext ifNil: [ ^ false ].
	aContext method == (WeakSet >> #growTo:) ifFalse: [ ^ false ].
	aContext receiver == aWeakSet ifFalse: [ ^ false ].
	aContext stackPtr > aContext numTemps ifFalse: [ ^ false ].
	^ (aContext top isKindOf: WeakArray)
		and: [ aContext top ~~ (aWeakSet instVarNamed: #array) ]
]

{ #category : #'private - processes' }
GtProcessMonitorTestServiceExamples >> newAdderFor: aService keeping: aCollection failures: aFailures [
	"Answer a not started process that adds one more process to aService.
	Errors signalled while adding are caught inside the adder and added to aFailures,
	so that they do not escape as unhandled errors of the stepped process"

	| aProcess |
	aProcess := aCollection add: [  ] newProcess.
	^ [ [ aService handleNewProcess: aProcess ]
		on: Error
		do: [ :anError | aFailures add: anError ] ] newProcess
]

{ #category : #'private - processes' }
GtProcessMonitorTestServiceExamples >> step: aProcess untilInsideGrowToBeforeStoringArrayOf: aWeakSet [
	"Step aProcess until it is inside WeakSet>>#growTo: with the new array created but not stored.
	Answer true if the point was reached within the step budget"

	| aCount |
	aCount := 0.
	[ aProcess isTerminated or: [ aCount >= self stepBudget ] ]
		whileFalse: [ aProcess step.
			aCount := aCount + 1.
			(self isProcess: aProcess insideGrowToBeforeStoringArrayOf: aWeakSet)
				ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #'private - processes' }
GtProcessMonitorTestServiceExamples >> step: aProcess untilTerminatedWithin: aMaximumNumberOfSteps [
	"Step aProcess until it terminates. Answer true if it terminated within the given number of steps"

	| aCount |
	aCount := 0.
	[ aProcess isTerminated or: [ aCount >= aMaximumNumberOfSteps ] ]
		whileFalse: [ aProcess step.
			aCount := aCount + 1 ].
	^ aProcess isTerminated
]

{ #category : #'private - processes' }
GtProcessMonitorTestServiceExamples >> stepBudget [
	"Maximum number of Process>>#step calls. Adding a process takes a few hundred steps"

	^ 20000
]

{ #category : #'private - processes' }
GtProcessMonitorTestServiceExamples >> terminateIfRunning: aProcessOrNil [
	aProcessOrNil ifNil: [ ^ self ].
	aProcessOrNil isTerminated ifFalse: [ aProcessOrNil terminate ]
]
