examples - self
exampleWithIndirectDependencies
	<gtExample>
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #b) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesOnInstanceSide >> #c) gtExample.
			(GtDummyExamplesOnInstanceSide >> #d) gtExample } 
		andIndirect: {
			(GtDummyExamplesOnInstanceSide >> #e) gtExample }.
		
	^ example