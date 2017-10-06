private
browseExamplesReferencing: aLiteral builder: aBuilder	
	(lastItem := aBuilder item: 'Browse examples referencing "' ,  aLiteral , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesReferencing: aLiteral ]