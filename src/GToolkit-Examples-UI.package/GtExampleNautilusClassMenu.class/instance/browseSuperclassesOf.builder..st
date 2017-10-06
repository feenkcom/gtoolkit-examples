private
browseSuperclassesOf: aClass builder: aBuilder
	(lastItem := aBuilder item: 'Browse examples in superclasses of class "' , aClass name , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesInSuperclassesOfClass: aClass ].