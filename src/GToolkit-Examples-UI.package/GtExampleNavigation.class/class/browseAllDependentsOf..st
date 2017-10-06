browse with scope
browseAllDependentsOf: aCollectionOfExamples
	self browse: 'All dependents' examples: (aCollectionOfExamples gather: [ :each | each allDependents ])