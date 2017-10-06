private
inspectExamples: aBlock builder: aBuilder
	(lastItem := aBuilder item: 'Inspect examples')
		parent: #gte;
		keyText: 'e, i' if: Nautilus useOldStyleKeys not;
		action: [ self examples: aBlock ];
		icon: Smalltalk ui icons glamorousInspect.