examples - combined
exampleWithSelfAndExternalDependenciesToSameMethod
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #kWithSelfAndExternalForSameMethod) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesExternalDependencies >> #j) gtExample } 
		andIndirect: { }.
		
	^ example