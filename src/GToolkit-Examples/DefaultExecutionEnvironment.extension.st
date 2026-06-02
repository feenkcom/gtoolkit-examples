Extension { #name : #DefaultExecutionEnvironment }

{ #category : #'*GToolkit-Examples-Core' }
DefaultExecutionEnvironment >> runExampleEvaluator: anExampleEvaluator [

	| testEnv exampleResult |
	testEnv := TestExecutionEnvironment new.
	
	exampleResult := nil.
	testEnv beActiveDuring: [
		exampleResult := testEnv runExampleEvaluator: anExampleEvaluator ].
		
	^ exampleResult
]

{ #category : #'*GToolkit-Examples-Core' }
DefaultExecutionEnvironment >> runUnmanagedExampleEvaluator: anExampleEvaluator [

	| testEnv exampleResult |
	testEnv := TestExecutionEnvironment new.
	
	exampleResult := nil.
	testEnv beActiveDuring: [
		"If we activate at this point the test execution environment we disable the monitor service
		to not track worker processes and stop them when the test ends."
		testEnv disableService: ProcessMonitorTestService.
		
		exampleResult := testEnv runUnmanagedExampleEvaluator: anExampleEvaluator ].
		
	^ exampleResult
]
