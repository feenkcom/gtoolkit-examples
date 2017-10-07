tests
testDebugRaisesUnexpectedZeroDevide
	| result |
	
	result := 42.
	self 
		should: [ result := (GtDummyExamplesWithExceptions class >> #j) gtExample debug ] 
		raise:  ZeroDivide.
	self assert: result equals: 42.