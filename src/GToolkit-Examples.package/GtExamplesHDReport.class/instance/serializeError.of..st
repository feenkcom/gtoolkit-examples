running
serializeError: error of: anExample
	"We got an error from a test, let's serialize it so we can properly debug it later on..."
	| context testCaseMethodContext |
	
	context := error signalerContext.
	testCaseMethodContext := context findContextSuchThat: [ :ctx| 
		ctx receiver == anExample and: [ ctx methodSelector == #performTest ]].
	context := context copyTo: testCaseMethodContext.
	
	[ FuelOutStackDebugAction
		serializeTestFailureContext: context sender 		
		toFileNamed: anExample methodClass name asString,'-', anExample selector, '.fuel' ] 
	on: Error 
	do: [:err| "simply continue..." ]

