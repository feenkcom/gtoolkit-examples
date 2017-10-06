running
runAll
	CurrentExecutionEnvironment runTestsBy: [ 
		examples do: [ :each | each ignoreTest ifFalse: [ self runExample: each ] ]
	]