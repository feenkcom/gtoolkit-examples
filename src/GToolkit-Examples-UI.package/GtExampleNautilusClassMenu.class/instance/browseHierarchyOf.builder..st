private
browseHierarchyOf: aClass builder: aBuilder
	(lastItem := aBuilder item: 'Browse examples in hierarchy of class "' , aClass name , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesInHierarchyOfClass: aClass ].