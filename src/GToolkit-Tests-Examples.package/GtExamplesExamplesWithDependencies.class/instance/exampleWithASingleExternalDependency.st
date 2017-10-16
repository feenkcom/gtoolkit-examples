examples - external
exampleWithASingleExternalDependency
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #e) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { (GtDummyExamplesOnInstanceSide >> #e) gtExample } 
		andIndirect: { }.
		
	^ example