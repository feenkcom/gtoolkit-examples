private
browseAllExamples: aBuilder
	(lastItem := aBuilder item: 'Browse all examples')
		parent: #gte;
		keyText: 'e, a' if: Nautilus useOldStyleKeys not;
		action: [ GtExampleNavigation browseExamples ];
		icon: Smalltalk ui icons nautilus
