examples - super
exampleWithSuperDependencyToSameSelector
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #dCallSuper) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #dCallSuper) gtExample } 
		andIndirect: { }.
		
	^ example