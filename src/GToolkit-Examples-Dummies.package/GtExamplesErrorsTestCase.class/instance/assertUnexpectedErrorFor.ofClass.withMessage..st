asserting
assertUnexpectedErrorFor: anExampleResult ofClass: anErrorClass withMessage: anErrorMessage
	| originalError |
	
	self assert: anExampleResult hasProblems.
	self assert: anExampleResult isSuccess not.
	self assert: anExampleResult isExpectedError not.
	self assert: anExampleResult isUnexpectedError.
	self assert: anExampleResult isFailure.
	self assert: anExampleResult isError not.
	self assert: anExampleResult returnValue isNil.
	
	self assert: anExampleResult unexpectedError notNil.
	self assert: anExampleResult unexpectedError class equals: GtExampleUnexpectedExceptionRaised.
	
	originalError := anExampleResult unexpectedError unexpectedError.
	self assert: originalError notNil.
	self assert: originalError messageText equals: anErrorMessage.
	self assert: originalError class equals: anErrorClass.
	
	"When an unexpected error happens there should be no expected error registered"
	self assert: anExampleResult expectedError isNil.