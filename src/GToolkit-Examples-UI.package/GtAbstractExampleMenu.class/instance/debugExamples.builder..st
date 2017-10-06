private
debugExamples: aBlock builder: aBuilder
	(lastItem := aBuilder item: 'Debug examples')
		parent: #gte;
		keyText: 'e, d' if: Nautilus useOldStyleKeys not;
		action: [ self examples: aBlock withProgressCollect: [ :each | each debug ] ];
		icon: Smalltalk ui icons smallDebug.