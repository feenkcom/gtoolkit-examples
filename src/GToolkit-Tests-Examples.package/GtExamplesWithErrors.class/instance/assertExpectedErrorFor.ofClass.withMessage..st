asserting
assertExpectedErrorFor: anExampleResult ofClass: anErrorClass withMessage: anErrorMessage
	
	self 
		assertExpectedExceltionFor: anExampleResult 
		ofClass: anErrorClass 
		withMessage: anErrorMessage.
	self assert: anExampleResult isFailure not.
	self assert: anExampleResult isError.
	