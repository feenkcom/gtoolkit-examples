"
I exemplify how the {{gtClass:TestExecutionEnvironment}} of a running example reaches code executed in promises ({{gtClass:TAsyncFuture}}, {{gtMethod:TAsyncFuture>>#await:}}).
I exist because promises run in processes forked by {{gtClass:AsyncFutureThreadPoolWorker}} workers, not by the example that scheduled them. Without isolation, they would see the environment of whichever process created the worker, and test services (failure tracking, process termination, coverage) would not cover asynchronous code.
I complement {{gtClass:GtExamplesForExecutionEnvironment}}, which exemplifies the same for plain {{gtMethod:BlockClosure>>#fork}}.
See {{gtMethod:GtExamplesForExecutionEnvironmentInPromises>>#promiseSeesExampleEnvironment}} for the basic case.
"
Class {
	#name : #GtExamplesForExecutionEnvironmentInPromises,
	#superclass : #Object,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #private }
GtExamplesForExecutionEnvironmentInPromises >> currentObservation [
	"Answer what the active process observes: its execution environment and, when running in a promise, the worker process that forked it"

	^ Dictionary new
		at: #environment put: CurrentExecutionEnvironment value;
		at: #workerProcess
			put: (AsyncProcessProperties
					process: Processor activeProcess
					property: #parentProcess
					ifAbsent: [ nil ]);
		yourself
]

{ #category : #'examples - setup' }
GtExamplesForExecutionEnvironmentInPromises >> exampleSchedulingPromise [
	"This example is a noTest as it is only run from #runExampleSchedulingPromiseLeavesNoWorkerProcess"

	<gtExample>
	<noTest>
	^ self observePromise
]

{ #category : #'examples - setup' }
GtExamplesForExecutionEnvironmentInPromises >> exampleWithFailingPromise [
	"This example is a noTest as it is designed to fail.
	The promise passes its error (AsyncPassExceptionHandler) instead of only rejecting,
	so it fails the example like a failing forked process does"

	<gtExample>
	<noTest>
	| aDoneSemaphore |
	aDoneSemaphore := Semaphore new.

	[ [ 1 / 0 ] ensure: [ aDoneSemaphore signal ] ] asAsyncFuture
		await: (AsyncFutureExecutionConfiguration new
				errorHandler: AsyncPassExceptionHandler new).

	self assert: (aDoneSemaphore waitTimeoutSeconds: 30) not.
	self assert: true
]

{ #category : #'examples - environment' }
GtExamplesForExecutionEnvironmentInPromises >> nestedPromiseSeesExampleEnvironment [
	"A promise scheduled from inside a promise also sees the example's environment"

	<gtExample>
	| anEnvironment anOuterObservation anInnerObservation |
	anEnvironment := CurrentExecutionEnvironment value.
	self assert: anEnvironment isTest.

	anOuterObservation := self
			observePromiseDuring: [ anInnerObservation := self observePromise ].

	self assert: (anOuterObservation at: #environment) == anEnvironment.
	self assert: anInnerObservation notNil.
	self assert: (anInnerObservation at: #environment) == anEnvironment.
	^ anInnerObservation
]

{ #category : #private }
GtExamplesForExecutionEnvironmentInPromises >> observeInNewTestEnvironmentSignalling: aStartedSemaphore waitingOn: aReleaseSemaphore [
	"Simulate an independent example run (like {{gtMethod:DefaultExecutionEnvironment>>#runExampleEvaluator:}}):
	activate a new test environment, schedule a promise that signals aStartedSemaphore and waits for aReleaseSemaphore,
	then clean up. Answer the environment and the promise observation"

	| anEnvironment anObservation |
	DefaultExecutionEnvironment
		beActiveDuring: [ anEnvironment := TestExecutionEnvironment new.
			anEnvironment
				beActiveDuring: [ [ anObservation := self
							observePromiseDuring: [ aStartedSemaphore signal.
								aReleaseSemaphore waitTimeoutSeconds: 30 ] ]
						ensure: [ anEnvironment cleanUpAfterTest ] ] ].
	^ anEnvironment -> anObservation
]

{ #category : #private }
GtExamplesForExecutionEnvironmentInPromises >> observePromise [
	"Schedule a promise and answer what it observed"

	^ self observePromiseDuring: [  ]
]

{ #category : #private }
GtExamplesForExecutionEnvironmentInPromises >> observePromiseDuring: aBlock [
	"Schedule a promise that records its observation and then evaluates aBlock.
	Wait (with a timeout, not a fixed delay) until it is done and answer the observation"

	| aDoneSemaphore anObservation |
	aDoneSemaphore := Semaphore new.

	[ anObservation := self currentObservation.
	[ aBlock value ] ensure: [ aDoneSemaphore signal ] ] asAsyncPromise.

	self
		assert: (aDoneSemaphore waitTimeoutSeconds: 30) not
		description: [ 'The promise did not finish in time' ].

	^ anObservation
]

{ #category : #'examples - environment' }
GtExamplesForExecutionEnvironmentInPromises >> parallelTestEnvironmentsSeeOnlyTheirOwnEnvironment [
	"Two test environments active at the same time in different processes:
	each promise sees only the environment that scheduled it, and they do not share worker processes"

	<gtExample>
	| aStarted aRelease aDone aFirst aSecond |
	aStarted := Semaphore new.
	aRelease := Semaphore new.
	aDone := Semaphore new.

	[ [ aFirst := self
			observeInNewTestEnvironmentSignalling: aStarted
			waitingOn: aRelease ] ensure: [ aDone signal ] ] fork.
	[ [ aSecond := self
			observeInNewTestEnvironmentSignalling: aStarted
			waitingOn: aRelease ] ensure: [ aDone signal ] ] fork.	"Both promises are running at the same time before any of them is released"
	self assert: (aStarted waitTimeoutSeconds: 30) not.
	self assert: (aStarted waitTimeoutSeconds: 30) not.
	aRelease
		signal;
		signal.
	self assert: (aDone waitTimeoutSeconds: 30) not.
	self assert: (aDone waitTimeoutSeconds: 30) not.

	self assert: aFirst key ~~ aSecond key.
	self assert: (aFirst value at: #environment) == aFirst key.
	self assert: (aSecond value at: #environment) == aSecond key.
	self
		assert: (aFirst value at: #workerProcess) ~~ (aSecond value at: #workerProcess).
	^ {aFirst.
		aSecond}
]

{ #category : #'examples - environment' }
GtExamplesForExecutionEnvironmentInPromises >> promiseFailingWithDefaultErrorHandlerIsOnlyRejected [
	"With the default error handler, an error in a promise only rejects it: the example is not failed"

	<gtExample>
	| aDoneSemaphore aPromise anError |
	aDoneSemaphore := Semaphore new.

	aPromise := [ 1 / 0 ] asAsyncPromise.
	aPromise
		then: [ :aValue | aDoneSemaphore signal ]
		otherwise: [ :anException | 
			anError := anException.
			aDoneSemaphore signal ].

	self assert: (aDoneSemaphore waitTimeoutSeconds: 30) not.
	self assert: (anError isKindOf: ZeroDivide).
	^ aPromise
]

{ #category : #'examples - environment' }
GtExamplesForExecutionEnvironmentInPromises >> promiseOutsideTestUsesGlobalPool [
	"Outside a test, promises run on the global thread pool with the default environment"

	<gtExample>
	| anObservation aWorkerProcess aWorker |
	DefaultExecutionEnvironment
		beActiveDuring: [ anObservation := self observePromise ].

	self assert: (anObservation at: #environment) isTest not.

	aWorkerProcess := anObservation at: #workerProcess.
	self assert: aWorkerProcess notNil.
	aWorker := (AsyncProcessProperties
			reifiedProcess: aWorkerProcess
			ifAbsent: [ nil ]) worker.
	self assert: (AsyncFutureThreadPool current workerArray includes: aWorker).
	^ anObservation
]

{ #category : #'examples - environment' }
GtExamplesForExecutionEnvironmentInPromises >> promiseSeesExampleEnvironment [
	"A promise scheduled by an example sees the example's test execution environment"

	<gtExample>
	| anEnvironment anObservation |
	anEnvironment := CurrentExecutionEnvironment value.
	self assert: anEnvironment isTest.

	anObservation := self observePromise.

	self assert: (anObservation at: #environment) == anEnvironment.
	^ anObservation
]

{ #category : #'examples - execution' }
GtExamplesForExecutionEnvironmentInPromises >> runExampleSchedulingPromiseLeavesNoWorkerProcess [
	"After an example ends, the worker process that ran its promise is no longer alive"

	<gtExample>
	| aResult aWorkerProcess |
	aResult := (self class >> #exampleSchedulingPromise) gtExample run.
	self assert: aResult isSuccess.

	aWorkerProcess := aResult returnValue at: #workerProcess.
	self assert: aWorkerProcess notNil.
	self assert: aWorkerProcess isTerminated.
	^ aResult
]

{ #category : #'examples - execution' }
GtExamplesForExecutionEnvironmentInPromises >> runExampleWithFailingPromise [
	"A promise failing in the background fails the example that scheduled it,
	like GtExamplesForExecutionEnvironment>>#runExampleWithFailingBackgroundProcess does for a forked process"

	<gtExample>
	| aTargetExample aResult |
	aTargetExample := (self class >> #exampleWithFailingPromise) gtExample.
	aResult := aTargetExample run.

	self assert: aResult isError.
	self assert: aResult returnValue class equals: TestFailedByForkedProcess.
	^ aResult
]

{ #category : #'examples - thread pool' }
GtExamplesForExecutionEnvironmentInPromises >> threadPoolInExampleIsOwn [
	"A running example has its own thread pool, created on first use and reused afterwards"

	<gtExample>
	| aService aThreadPool |
	aService := CurrentExecutionEnvironment value
			findService: AsyncFutureThreadPoolTestService.

	aThreadPool := AsyncFutureThreadPool forCurrentExecutionEnvironment.

	self assert: aService hasThreadPool.
	self assert: aThreadPool ~~ AsyncFutureThreadPool current.
	self
		assert: aThreadPool == AsyncFutureThreadPool forCurrentExecutionEnvironment.
	self assert: aThreadPool == aService threadPool.
	^ aThreadPool
]

{ #category : #'examples - thread pool' }
GtExamplesForExecutionEnvironmentInPromises >> threadPoolIsTerminatedAtCleanUp [
	"When a test ends, its thread pool is forgotten and its worker processes are terminated"

	<gtExample>
	| anEnvironment aService aThreadPool aDoneSemaphore anObservation |
	aDoneSemaphore := Semaphore new.

	DefaultExecutionEnvironment
		beActiveDuring: [ anEnvironment := TestExecutionEnvironment new.
			anEnvironment
				beActiveDuring: [ aService := anEnvironment findService: AsyncFutureThreadPoolTestService.
					aThreadPool := AsyncFutureThreadPool forCurrentExecutionEnvironment.
					aThreadPool
						schedule: (AsyncFuturePromise new
								future: [ anObservation := self currentObservation.
									aDoneSemaphore signal ] asAsyncFuture).
					self assert: (aDoneSemaphore waitTimeoutSeconds: 30) not.
					anEnvironment cleanUpAfterTest ] ].

	self assert: aService hasThreadPool not.
	self assert: (anObservation at: #environment) == anEnvironment.
	self assert: (anObservation at: #workerProcess) isTerminated.
	self
		assert: (aThreadPool workerArray allSatisfy: [ :eachWorker | eachWorker isRunning not ]).
	^ aThreadPool
]

{ #category : #'examples - thread pool' }
GtExamplesForExecutionEnvironmentInPromises >> threadPoolOutsideTestIsGlobal [
	"Outside a test, futures are scheduled on the global thread pool"

	<gtExample>
	| aThreadPool |
	DefaultExecutionEnvironment
		beActiveDuring: [ aThreadPool := AsyncFutureThreadPool forCurrentExecutionEnvironment ].

	self assert: aThreadPool == AsyncFutureThreadPool current.
	^ aThreadPool
]

{ #category : #'examples - thread pool' }
GtExamplesForExecutionEnvironmentInPromises >> unfinishedPromisesAreCancelledAtCleanUp [
	"When a test ends, its promises that are still running, waiting in a queue, or pending are cancelled,
	and the worker processes of its thread pool are terminated"

	<gtExample>
	| anEnvironment aStartedSemaphore aConfiguration aThreadPool aRunning aQueued aPending |
	aStartedSemaphore := Semaphore new.	"A custom group allows one worker only, so a second future waits in the queue"
	aConfiguration := AsyncFutureExecutionConfiguration new
			customGroup: #UnfinishedPromisesAreCancelledAtCleanUp.

	DefaultExecutionEnvironment
		beActiveDuring: [ anEnvironment := TestExecutionEnvironment new.
			anEnvironment
				beActiveDuring: [ aThreadPool := AsyncFutureThreadPool forCurrentExecutionEnvironment.
					aRunning := [ aStartedSemaphore signal.
						Semaphore new wait ] asAsyncFuture await: aConfiguration.
					self assert: (aStartedSemaphore waitTimeoutSeconds: 30) not.
					aQueued := [ #queued ] asAsyncFuture await: aConfiguration.
					aPending := AsyncPendingFuture new await.
					anEnvironment cleanUpAfterTest ] ].

	self assert: aRunning isCancelled.
	self assert: aQueued isCancelled.
	self assert: aPending isCancelled.
	self
		assert: (aThreadPool workerArray allSatisfy: [ :eachWorker | eachWorker isRunning not ]).
	^ {aRunning.
		aQueued.
		aPending}
]
