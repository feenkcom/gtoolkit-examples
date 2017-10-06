browse with scope
browseExamplesInSuperclassesOfClass: aClass
	self browse: 'Examples in superclasses of class "' , aClass name , '"' examples: (aClass withAllSuperclasses gather: [ :each | each gtExamples ])