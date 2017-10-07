tests
testExpectedErrorIsMessageNotUnderstood
	| result |
	
	result := (GtDummyExamplesInvalidDependencies class >> #b) gtExample run.
	self 
		assertExpectedErrorFor: result 
		ofClass: MessageNotUnderstood 
		withMessage: 'GtDummyExamplesInvalidDependencies class>>a1'