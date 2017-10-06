private
browseDependents: aCollection builder: aBuilder
	(lastItem := aBuilder item: #'Browse dependents')
		parent: #gte;
		action: [ GtExampleNavigation browseDependentsOf: aCollection ]