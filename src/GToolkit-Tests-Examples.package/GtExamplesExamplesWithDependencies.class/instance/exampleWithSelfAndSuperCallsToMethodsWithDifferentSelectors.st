examples - self&super
exampleWithSelfAndSuperCallsToMethodsWithDifferentSelectors
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #gCallsToDifferentSelfAndSuperMethods) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #aSuperclass) gtExample.
			(GtDummyExamplesInSubclass >> #bInBoth) gtExample } 
		andIndirect: { }.
		
	^ example