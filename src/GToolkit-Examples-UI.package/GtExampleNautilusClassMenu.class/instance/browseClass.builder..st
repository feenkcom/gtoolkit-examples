private
browseClass: aClass builder: aBuilder
	(lastItem := aBuilder item: 'Browse examples of class "' ,  aClass name , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesOfClass: aClass ].