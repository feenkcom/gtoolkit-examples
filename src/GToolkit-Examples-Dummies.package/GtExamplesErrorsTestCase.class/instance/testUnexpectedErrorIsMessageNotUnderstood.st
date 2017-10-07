tests
testUnexpectedErrorIsMessageNotUnderstood
	| result |
	
	result := (GtDummyExamplesInvalidDependencies class >> #a) gtExample run.
	self 
		assertUnexpectedErrorFor: result 
		ofClass: MessageNotUnderstood
		withMessage: 'GtDummyExamplesInvalidDependencies class>>a1'.