private
inspectReturnValue: aBlock builder: aBuilder
	(lastItem := aBuilder item: #'Inspect return-values')
		parent: #gte;
		keyText: 'e, v' if: Nautilus useOldStyleKeys not;
		action: [ self examples: aBlock withProgressCollect: [ :example | example returnValue ] ].