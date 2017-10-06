browse with scope
browseExamplesInHierarchyOfClass: aClass
	self browse: 'Examples in hierarchy of class "' , aClass name , '"' examples: (aClass withAllSubclasses gather: [ :each | each gtExamples ]), (aClass allSuperclasses gather: [ :each | each gtExamples ])