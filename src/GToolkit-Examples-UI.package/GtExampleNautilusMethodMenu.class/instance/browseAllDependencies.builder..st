private
browseAllDependencies: aCollection builder: aBuilder
	(lastItem := aBuilder item: #'Browse all dependencies')
		parent: #gte;
		action: [ GtExampleNavigation browseAllDependenciesOf: aCollection ]