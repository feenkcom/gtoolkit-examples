examples - self
exampleWithNoDependencies
	<gtExample>
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #e) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { } 
		andIndirect: { }.
	
	^ example