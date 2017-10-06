private
buildAllDependents: aCollection builder: aBuilder
	^ (aBuilder item: #'Browse all dependents')
		parent: #gte;
		action: [ GtExampleNavigation browseAllDependentsOf: aCollection ]