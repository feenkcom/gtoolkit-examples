private
browseSubclassesOf: aClass builder: aBuilder
	(lastItem := aBuilder item: 'Browse examples in subclasses of class "' , aClass name , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesInSubclassesOfClass: aClass ].