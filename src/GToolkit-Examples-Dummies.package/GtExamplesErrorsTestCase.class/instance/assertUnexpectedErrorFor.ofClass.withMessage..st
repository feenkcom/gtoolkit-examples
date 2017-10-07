asserting
assertUnexpectedErrorFor: anExampleResult ofClass: anErrorClass withMessage: anErrorMessage

	self assert: anExampleResult hasProblems.
	self assert: anExampleResult isSuccess not.
	self assert: anExampleResult isExpectedError not.
	self assert: anExampleResult isUnexpectedError.
	self assert: anExampleResult isFailure.
	self assert: anExampleResult isError not.
	self assert: anExampleResult returnValue isNil.
	
	self assert: anExampleResult unexpectedError notNil.
	self assert: anExampleResult unexpectedError messageText equals: anErrorMessage.
	self assert: anExampleResult unexpectedError class equals: anErrorClass.
	
	"When an unexpected error happens there should be no expected error registered"
	self assert: anExampleResult expectedError isNil.