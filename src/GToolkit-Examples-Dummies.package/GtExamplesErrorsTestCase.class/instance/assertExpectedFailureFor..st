asserting
assertExpectedFailureFor: anExampleResult 
	
	self 
		assertExpectedExceltionFor: anExampleResult 
		ofClass: AssertionFailure 
		withMessage: 'Assertion failed'.
	self assert: anExampleResult isFailure.
	self assert: anExampleResult isError not.
	