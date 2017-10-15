examples - combined
exampleWithSelfAndExternalDependenciesToDifferentMethods
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #hWithSelfAndExternalDependencies) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesExternalDependencies >> #c) gtExample .
			(GtDummyExamplesOnInstanceSide >> #e) gtExample } 
		andIndirect: { }.
		
	^ example