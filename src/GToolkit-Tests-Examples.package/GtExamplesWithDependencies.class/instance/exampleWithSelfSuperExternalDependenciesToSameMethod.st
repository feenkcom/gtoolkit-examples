examples - combined
exampleWithSelfSuperExternalDependenciesToSameMethod
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalSubclassDependencies >> #iWithSelfSuperExternalDependencies) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesExternalDependencies >> #j) gtExample } 
		andIndirect: { }.
		
	^ example