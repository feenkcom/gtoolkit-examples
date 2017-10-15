examples - self
exampleWithSameDependencyCalledTwice
	<gtExample>
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #sameExampleCalledTwice) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { (GtDummyExamplesOnInstanceSide >> #e) gtExample } 
		andIndirect: { }.
	
	^ example