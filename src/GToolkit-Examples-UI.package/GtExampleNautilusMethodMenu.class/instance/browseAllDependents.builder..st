private
browseAllDependents: aCollection builder: aBuilder
	(lastItem := aBuilder item: #'Browse all dependents')
		parent: #gte;
		action: [ GtExampleNavigation browseAllDependentsOf: aCollection ]