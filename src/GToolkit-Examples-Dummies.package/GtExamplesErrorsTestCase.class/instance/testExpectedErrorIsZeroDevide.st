tests
testExpectedErrorIsZeroDevide
	| result |
	
	result := (GtDummyExamplesWithExceptions class >> #a) gtExample run.
	self 
		assertExpectedErrorFor: result 
		ofClass: ZeroDivide 
		withMessage: ''