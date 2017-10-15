examples - self&super
exampleWithSelfCallToSuperMethod
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #hSelfCallToMethodFromSuperclass) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #aSuperclass) gtExample } 
		andIndirect: { }.
		
	^ example