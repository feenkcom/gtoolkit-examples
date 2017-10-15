examples - external
exampleWithDirectExternalDependency
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #fWithIndirectExtenalDependency) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesExternalDependencies >> #e) gtExample } 
		andIndirect: {
			(GtDummyExamplesOnInstanceSide >> #e) gtExample}.
		
	^ example