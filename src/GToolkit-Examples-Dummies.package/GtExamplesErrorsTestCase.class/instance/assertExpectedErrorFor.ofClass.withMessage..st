asserting
assertExpectedErrorFor: anExampleResult ofClass: anErrorClass withMessage: anErrorMessage
	
	self assert: anExampleResult hasProblems not. "No problem if the error is expected"
	self assert: anExampleResult isSuccess.
	self assert: anExampleResult isExpectedError.
	self assert: anExampleResult isUnexpectedError not.
	self assert: anExampleResult isFailure not.
	self assert: anExampleResult isError not.
	self assert: anExampleResult returnValue isNil.
	
	self assert: anExampleResult expectedError notNil.
	self assert: anExampleResult expectedError messageText equals: anErrorMessage.
	self assert: anExampleResult expectedError class equals: anErrorClass.
	
	"When an expected error happens there should be no unexpected error registered"
	self assert: anExampleResult unexpectedError isNil.