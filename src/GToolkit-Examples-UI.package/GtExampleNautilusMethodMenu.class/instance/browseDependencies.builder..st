private
browseDependencies: aCollection builder: aBuilder 
	(lastItem := aBuilder item: #'Browse dependencies')
		parent: #gte;
		action: [ GtExampleNavigation browseDependenciesOf: aCollection ]