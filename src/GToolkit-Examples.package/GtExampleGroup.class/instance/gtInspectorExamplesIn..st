ui
gtInspectorExamplesIn: composite
	<gtInspectorPresentationOrder: 1>
	| examplesWithResults |
	examplesWithResults := self examples collect: [ :each | GtExampleWithResult new example: each ].
	composite fastTable
		title: 'Examples';
		display: [ examplesWithResults ];
		icon: [ :each | each icon ];
		column: 'Status' evaluated: [ :each | each statusText ] width: 80;
		column: 'Result' evaluated: [ :each | each resultOrErrorClassName ] width: 120;
		"column: 'Name' evaluated: [ :each | each gtDisplayString ];"
		column: 'Selector' evaluated: [ :each | each example selector ];
		column: 'Class' evaluated: [ :each | each example methodClass instanceSide name ];
		selectionAct: [ :list | 
			list rawSelection run.
			list update.
			list selection: list rawSelection result returnValue ]
			on: $r
			entitled: 'Run';
		selectionAct: [ :list | 
			list rawSelection debug.
			list update ]
			entitled: 'Debug';
		act: [ :list | 
			list displayValue 
				do: [ :each | each ignoreTest ifFalse: [ each run ]] 
				displayingProgress: 'Running examples ...'.
			list update ]
			on: $R
			entitled: 'Run all';
		send: [ :each | 
			(each isKindOf: GtExampleWithResult)
				ifTrue: [ each example ]
				ifFalse: [ each ] ]