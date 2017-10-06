private
inspectAllExamples: aBuilder
	(lastItem := aBuilder item: 'Inspect all examples')
		parent: #gte;
		action: [ self examples: [ Smalltalk gtExamplesContained ] ];
		icon: Smalltalk ui icons glamorousInspect.