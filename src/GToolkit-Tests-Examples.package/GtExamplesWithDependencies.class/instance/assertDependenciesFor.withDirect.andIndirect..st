asserting
assertDependenciesFor: anExample withDirect: expectedDirectDependencies andIndirect: expectedIndirectDependencies
	^ self 
		assertDependenciesFor: anExample 
		withDirect: expectedDirectDependencies 
		andAll: expectedDirectDependencies asOrderedCollection, expectedIndirectDependencies
	
	
		