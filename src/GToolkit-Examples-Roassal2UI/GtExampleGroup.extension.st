Extension { #name : #GtExampleGroup }

{ #category : #'*GToolkit-Examples-Roassal2UI' }
GtExampleGroup >> gtInspectorMapIn: composite [
	<gtInspectorPresentationOrder: 2>
	self flag: 'Temporary solution in case rossal is not present'.
	(composite class canPerform: #roassal2) ifFalse: [ ^ self ].
	composite roassal2
		title: 'Map';
		initializeView: [ RTMondrian new ];
		painting: [ :view | 
			view interaction popupText: [ :example | example key name ].
			view shape rectangle fillColor: Color white darker.
			view nodes: (self groupedBy: #methodClass) associations forEach: [ :assoc | 
				view interaction popupText: [ :example | example gtDisplayString ].
				view shape circle size: 10; fillColor: Color transparent; borderColor: Color black.
				view nodes: assoc value.
				view shape line color: (Color black alpha: 0.5).
				view edges 
					source: assoc value 
					connectFrom: #yourself 
					toAll: [ :each | 
						self select: [:exampleWithResult | 
							each directDependencies anySatisfy: [ :dependency | exampleWithResult example = dependency ]]].
				view layout dominanceTree ].
			view edges 
				source: self examples 
				connectFrom: #yourself
				toAll: [ :each | 
					each directDependencies select: [ :dependent | 
						dependent methodClass ~= each methodClass ] ] ];
		send: [ :exampleOrAssociation | 
			(exampleOrAssociation isKindOf: Association) 
			ifTrue: [ exampleOrAssociation value ] 
			ifFalse: [exampleOrAssociation] ]
]
