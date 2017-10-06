private
buildDependencies: aCollection builder: aBuilder 
	^ (aBuilder item: #'Browse dependencies')
		parent: #gte;
		action: [ GtExampleNavigation browseDependenciesOf: aCollection ]