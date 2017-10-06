private
browseAllExamplesIgnoredByTests: aBuilder		
	(lastItem := aBuilder item: 'Browse all examples ignored by tests')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesIgnoredByTests ]