private
browseAllExamplesWithProblems: aBuilder		
	(lastItem := aBuilder item: 'Browse all examples with problems')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesWithProblems ];
		icon: Smalltalk ui icons smallError.