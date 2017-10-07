tests
testDebugRaisesUnexpectedMessageNotUnderstood
	| result |
	
	result := 42.
	self 
		should: [ result := (GtDummyExamplesInvalidDependencies class >> #a) gtExample debug ] 
		raise: MessageNotUnderstood.
	self assert: result equals: 42.