browse with scope
browseDependentsOf: aCollectionOfExamples
	self browse: 'Dependents' examples: (aCollectionOfExamples gather: [ :each | each directDependents ])