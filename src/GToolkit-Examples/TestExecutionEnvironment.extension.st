Extension { #name : #TestExecutionEnvironment }

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> hasCompletedTest [
	^ testCompleted
]

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> runExampleEvaluator: anExampleEvaluator [
	
	| exampleResult |
	
	testCase := anExampleEvaluator.
	maxTimeForTest := anExampleEvaluator timeLimit.
	testCompleted := false.
	watchDogSemaphore signal. "signal about new test case"	
	[ exampleResult := self runExampleUnderWatchdogUsingEvaluator: anExampleEvaluator] ensure: [
		testCompleted := true.
		watchDogSemaphore signal.  "signal that test case is completed"	
		self cleanUpAfterTest ].
		
	^ exampleResult
]

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> runExampleUnderWatchdogUsingEvaluator: anEvaluator [
	| exampleResult |
	exampleResult := nil.
	[
		[ exampleResult := anEvaluator runUnmanaged ] ensure: [
			"Terminated test is not considered as completed (user just closed a debugger for example)"
			mainTestProcess isTerminating ifFalse: [ 
				self handleCompletedTest ]]
	] on: Exception do: [ :err | 
			self handleException: err 
	].
	
	^ exampleResult
]

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionEnvironment >> runUnmanagedExampleEvaluator: anExampleEvaluator [
	| exampleResult |
	testCase := anExampleEvaluator.
	[ exampleResult := anExampleEvaluator value ] ensure: [ 
		testCompleted := true ].
	^ exampleResult
]
