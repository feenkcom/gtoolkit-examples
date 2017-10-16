examples - self&super
exampleWithSelfAndSuperCallsToSameMethod
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #eTwoCallsToSameSuperclassMethodWithSameSelector) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #aSuperclass) gtExample.
			"(GtDummyExamplesInSubclass >> #aSuperclass) gtExample" } 
		andIndirect: { }.
		
	^ example