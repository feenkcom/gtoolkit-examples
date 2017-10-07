tests
testUnexpectedErrorIsAssertionFailed
	| result |
	
	result := (GtDummyExamplesWithExceptions class >> #e) gtExample run.
	self 
		assertUnexpectedErrorFor: result 
		ofClass: AssertionFailure 
		withMessage: 'Assertion failed'