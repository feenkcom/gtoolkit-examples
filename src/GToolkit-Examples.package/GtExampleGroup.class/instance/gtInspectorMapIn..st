as yet unclassified
gtInspectorMapIn: composite
	<gtInspectorPresentationOrder: 2>
	composite roassal2
		title: 'Map';
		initializeView: [ RTMondrian new ];
		painting: [ :view | 
			view interaction popupText: [ :example | example key name ].
			view shape rectangle fillColor: Color white darker.
			view nodes: (self examples groupedBy: #methodClass) associations forEach: [ :assoc | 
				view interaction popupText: [ :example | example gtDisplayString ].
				view shape circle size: 10; fillColor: Color transparent; borderColor: Color black.
				view nodes: assoc value.
				view shape line color: (Color black alpha: 0.5).
				view edges source: assoc value connectFrom: #yourself toAll: #dependenciesOrArguments.
				view layout dominanceTree ].
			view edges 
				source: self examples 
				connectFrom: #yourself
				toAll: [ :each | 
					each dependenciesOrArguments select: [ :dependent | 
						dependent methodClass ~= each methodClass ] ] ];
		send: [ :x | (x isKindOf: Association) ifTrue: [ self class new examples: x value ] ifFalse: [ x ] ]