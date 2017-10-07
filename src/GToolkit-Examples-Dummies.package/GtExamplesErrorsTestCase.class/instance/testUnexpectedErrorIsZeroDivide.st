tests
testUnexpectedErrorIsZeroDivide
	| result |
	
	result := (GtDummyExamplesWithExceptions class >> #j) gtExample run.
	self 
		assertUnexpectedErrorFor: result 
		ofClass: ZeroDivide 
		withMessage: ''.