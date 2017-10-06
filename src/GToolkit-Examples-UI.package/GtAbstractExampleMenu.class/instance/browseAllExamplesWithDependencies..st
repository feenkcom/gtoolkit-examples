private
browseAllExamplesWithDependencies: aBuilder
	(lastItem := aBuilder item: 'Browse all examples with dependencies')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesWithDependencies ]