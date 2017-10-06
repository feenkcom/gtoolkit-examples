browse with scope
browseExamplesInSubclassesOfClass: aClass
	self browse: 'Examples in subclasses of class "' , aClass name , '"' examples: (aClass withAllSubclasses gather: [ :each | each gtExamples ])