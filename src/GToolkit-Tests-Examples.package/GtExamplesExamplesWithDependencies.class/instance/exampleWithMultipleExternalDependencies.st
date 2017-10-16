examples - external
exampleWithMultipleExternalDependencies
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #b) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesOnInstanceSide >> #c) gtExample .
			(GtDummyExamplesOnInstanceSide >> #d) gtExample } 
		andIndirect: {
			(GtDummyExamplesOnInstanceSide >> #e) gtExample}.
		
	^ example