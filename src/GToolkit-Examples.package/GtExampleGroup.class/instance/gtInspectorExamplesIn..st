ui
gtInspectorExamplesIn: composite
	<gtInspectorPresentationOrder: 1>

	composite wrapper with: [:w | 
		w 
			title: 'Examples (' , self examples size gtDisplayString , ')';
			addAction: self newRunAllAction;
			show: [ :anotherComposite | 
				anotherComposite fastTable
					display: [ self examples ];
					icon: [ :each | each icon ];
					"sorted: [ :a :b | a statusText < b statusText ];"
					column: 'Status'
						evaluated: [ :each | '' ]
						width: 100
						tags: [ :each | {each statusText} ]
						sortedBy: [ :a :b | a statusText < b statusText ];
					column: 'Result'
						evaluated: [ :each | '' ]
						width: 120
						tags: [ :each | {each resultOrErrorName} ]
						sortedBy: [ :a :b | a resultOrErrorName < b resultOrErrorName ];
					column: 'Selector' 
						evaluated: [ :each | each example selector ];
					column: 'Class'
						evaluated: [ :each | '' ]
						tags: [ :each | { 
							each example methodClass instanceSide name. 
							each example methodProtocol } ]
						sortedBy: [ :a :b | 
							(a example methodClass instanceSide name 
							<= b example methodClass instanceSide name) and: [ 
								a example methodProtocol <= b example methodProtocol ] ];
					enableFilter: [ :example :pattern | 
						self matchesExampleWithResult: example withPattern: pattern ];
					selectionAct: [ :list | 
						list rawSelection run.
						list update.
						(list pane port: #toSelect) value: list rawSelection result returnValue ]
						on: $r
						entitled: 'Run';
					selectionAct: [ :list | 
						list rawSelection debug.
						list update ]
						on: $D
						entitled: 'Debug';
					send: [ :each | 
						(each isKindOf: GtExampleWithResult)
							ifTrue: [ each example ]
							ifFalse: [ each ] ].
				w transmit fromOutsidePort: #toSelect; toOutsidePort: #selection ] ]