examples - self
exampleWithIndirectDependenciesSharingADependency
	<gtExample>
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #a) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesOnInstanceSide >> #b) gtExample.
			(GtDummyExamplesOnInstanceSide >> #c) gtExample } 
		andAll: {
			(GtDummyExamplesOnInstanceSide >> #b) gtExample.
			(GtDummyExamplesOnInstanceSide >> #c) gtExample.
			(GtDummyExamplesOnInstanceSide >> #d) gtExample.
			(GtDummyExamplesOnInstanceSide >> #e) gtExample
		}.
		
	^ example