Extension { #name : #CurrentExecutionEnvironment }

{ #category : #'*GToolkit-Examples-Core' }
CurrentExecutionEnvironment class >> runExampleEvaluator: anExampleEvaluator [

	^ self value runExampleEvaluator: anExampleEvaluator
]

{ #category : #'*GToolkit-Examples-Core' }
CurrentExecutionEnvironment class >> runUnmanagedExampleEvaluator: anExampleEvaluator [

	^ self value runUnmanagedExampleEvaluator: anExampleEvaluator
]
