tests
exampleResultWithMessageNotUnderstoodException
	<gtExample>
	| result |
	
	result := self exampleRaisingMessageNotUnderstoodException run.
	self 
		assertExpectedErrorFor: result 
		ofClass: MessageNotUnderstood 
		withMessage: 'GtDummyExamplesInvalidDependencies class>>a1'.
	
	^ result