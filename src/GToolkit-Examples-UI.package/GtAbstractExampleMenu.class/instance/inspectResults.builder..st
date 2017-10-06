private
inspectResults: aBlock builder: aBuilder
	(lastItem := aBuilder item: 'Inspect results (full)')
		parent: #gte;
		action: [ self examples: aBlock withProgressCollect: [ :example | example result ] ].