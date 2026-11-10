Extension { #name : #TestExecutionEnvironment }

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> hasCompletedTest [
	^ testCompleted
]

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> isRunningTestCase [
	"Answer true while a test case or an example runs in this environment"

	^ testCase notNil and: [ testCompleted not ]
]

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> runExampleEvaluator: anExampleEvaluator [
	| exampleResult |
	self isRunningTestCase
		ifTrue: [ ^ self runNestedExampleEvaluator: anExampleEvaluator ].

	testCase := anExampleEvaluator.
	maxTimeForTest := anExampleEvaluator timeLimit.
	testCompleted := false.
	watchDogSemaphore signal.	"signal about new test case"
	[ exampleResult := self
			runExampleUnderWatchdogUsingEvaluator: anExampleEvaluator ]
		ensure: [ testCompleted := true.
			watchDogSemaphore signal.	"signal that test case is completed"
			self cleanUpAfterTest ].

	^ exampleResult
]

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> runExampleUnderWatchdogUsingEvaluator: anEvaluator [
	"Evaluate the example directly (not through #runUnmanaged, which would
	re-enter the environment and disable the process monitor service)."

	| exampleResult |
	exampleResult := nil.
	[ [ exampleResult := anEvaluator value ]
		ensure: [  "Terminated test is not considered as completed (user just closed a debugger for example)"mainTestProcess
				isTerminating ifFalse: [ self handleCompletedTest ] ] ]
		on: Exception
		do: [ :err | self handleException: err ].
	^ exampleResult
]

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> runNestedExampleEvaluator: anExampleEvaluator [
	"Run an example that is started by the running test case or example (e.g. by a Lepiter example annotation or a locally executed example suite) in its own environment.
	Otherwise its clean up would stop the thread pool, promises and forked processes of the running one, and change its time limit"

	| aNestedEnvironment exampleResult |
	aNestedEnvironment := self class new.
	aNestedEnvironment
		beActiveDuring: [ exampleResult := aNestedEnvironment runExampleEvaluator: anExampleEvaluator ].
	^ exampleResult
]

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> runUnmanagedExampleEvaluator: anExampleEvaluator [
	| exampleResult |
	"We make sure the monitor service is disabled to not track
	worker processes and stop them when the test ends."
	self disableService: ProcessMonitorTestService.
	testCase := anExampleEvaluator.
	testCompleted := false.
	[ exampleResult := anExampleEvaluator value ] ensure: [
		testCompleted := true ].
	^ exampleResult
]
