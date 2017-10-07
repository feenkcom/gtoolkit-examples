tests
testDebugRaisesExpectedAssertionFailed
	| result example |
	
	example := (GtDummyExamplesWithExceptions class >> #i) gtExample.
	self assert: example isValid.
	
	result := 42.
	self 
		should: [ result := example debug ] 
		raise:  AssertionFailure.
	self assert: result equals: 42.