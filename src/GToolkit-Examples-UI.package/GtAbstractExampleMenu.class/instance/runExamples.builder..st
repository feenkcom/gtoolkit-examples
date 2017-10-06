private
runExamples: aBlock builder: aBuilder
	(lastItem := aBuilder item: 'Run examples')
		parent: #gte;
		keyText: 'e, r' if: Nautilus useOldStyleKeys not;
		action: [ self examples: aBlock withProgressCollect: [ :each | each run ] ];
		icon: Smalltalk ui icons smallDoIt.