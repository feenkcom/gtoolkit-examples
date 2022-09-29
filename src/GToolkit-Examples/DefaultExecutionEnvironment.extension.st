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
