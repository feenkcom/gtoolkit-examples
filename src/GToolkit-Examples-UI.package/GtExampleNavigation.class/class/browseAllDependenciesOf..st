browse with scope
browseAllDependenciesOf: aCollectionOfExamples
	self browse: 'Dependencies' examples: (aCollectionOfExamples gather: [ :each | each allDependencies ])