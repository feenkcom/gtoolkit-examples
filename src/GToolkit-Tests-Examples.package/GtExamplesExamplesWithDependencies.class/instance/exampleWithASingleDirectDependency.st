examples - self
exampleWithASingleDirectDependency
	<gtExample>
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #d) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesOnInstanceSide >> #e) gtExample } 
		andIndirect: { }.
		
	^ example