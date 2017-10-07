tests
testExpectedErrorIsAssertionFailed
	| result |
	
	result := (GtDummyExamplesWithExceptions class >> #i) gtExample run.
	self 
		assertExpectedErrorFor: result 
		ofClass: AssertionFailure 
		withMessage: 'Assertion failed'.