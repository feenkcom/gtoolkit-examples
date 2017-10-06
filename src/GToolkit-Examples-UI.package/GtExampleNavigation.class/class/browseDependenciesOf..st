browse with scope
browseDependenciesOf: aCollectionOfExamples
	self browse: 'Dependencies' examples: (aCollectionOfExamples gather: [ :each | each dependencies ])