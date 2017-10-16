examples - super
exampleWithSuperDependencyToDifferentSelector
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #eCallToDifferentSuper) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #dCallSuper) gtExample } 
		andIndirect: { }.
		
	^ example