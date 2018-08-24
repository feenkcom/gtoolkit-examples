Extension { #name : #GtExample }

{ #category : #'*GToolkit-Examples-Roassal2UI' }
GtExample >> gtInspectorDependenciesGraphIn: composite [
	<gtInspectorPresentationOrder: 1>
	self flag: 'Temporary solution in case rossal is not present'.
	(composite class canPerform: #roassal2) ifFalse: [ ^ self ].
	^ composite roassal2
		title: 'Graph';
		initializeView: [ RTMondrian new ];
		painting: [ :view | 
			view shape circle 
				borderColor: Color black;	
				color: [ :each | each = self ifTrue: [Color gray] ifFalse: [Color white]];
				size: 10.			
			view nodes: (self withDeepCollect: #directDependencies) asSet.
			view edges moveBehind; connectToAll: #directDependencies.
			view layout tree ];
		when: [ self hasDependencies ]
]
