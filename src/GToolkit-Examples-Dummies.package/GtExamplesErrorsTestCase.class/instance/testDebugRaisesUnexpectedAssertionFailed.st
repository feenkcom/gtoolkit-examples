tests
testDebugRaisesUnexpectedAssertionFailed
	| result |
	
	result := 42.
	self 
		should: [ result := (GtDummyExamplesWithExceptions class >> #e) gtExample debug ] 
		raise:  AssertionFailure.
	self assert: result equals: 42.