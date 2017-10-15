examples - self&super
exampleWithSelfAndSuperCallsToMethodsWithSameSelectors
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #fTwoCallsToDifferentMethodsWithSameSelector) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #bInBoth) gtExample.
			(GtDummyExamplesInSubclass >> #bInBoth) gtExample } 
		andIndirect: { }.
		
	^ example