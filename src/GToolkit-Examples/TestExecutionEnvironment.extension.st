Extension { #name : #TestExecutionEnvironment }

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> disableServicesForUnmanagedExampleRun [
	"Disable the services that clean up after a test, because an unmanaged example run is not cleaned up"

	services
		do: [ :each | each isEnabledInUnmanagedExampleRuns ifFalse: [ each disable ] ]
]

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
	"Run the example without the clean up of #runExampleEvaluator:, e.g. when a user plays it in a method coder:
	processes it forks and promises it schedules keep running after it ends.
	An example that starts while another test case or example is running (e.g. a scripter example clicking a play button)
	runs as a part of the running one, without changing its state, so that the running one's clean up still covers it"

	| exampleResult |
	self isRunningTestCase ifTrue: [ ^ anExampleEvaluator value ].

	self disableServicesForUnmanagedExampleRun.
	testCase := anExampleEvaluator.
	testCompleted := false.
	[ exampleResult := anExampleEvaluator value ] ensure: [ testCompleted := true ].
	^ exampleResult
]
