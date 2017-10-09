asserting
assertExpectedExceltionFor: anExampleResult ofClass: anErrorClass withMessage: anErrorMessage
	
	self assert: anExampleResult example hasProblems not description: 'No problem just an exception'.
	 
	self assert: anExampleResult hasProblems description: 'A result with an exception has problems'.
	self assert: anExampleResult hasException.
	self assert: anExampleResult isSuccess not.
	self assert: anExampleResult returnValue isNil.
	
	self assert: anExampleResult exampleException notNil.
	self assert: anExampleResult exampleException messageText equals: anErrorMessage.
	self assert: anExampleResult exampleException class equals: anErrorClass.