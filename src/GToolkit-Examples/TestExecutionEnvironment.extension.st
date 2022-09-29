Extension { #name : #TestExecutionEnvironment }

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
