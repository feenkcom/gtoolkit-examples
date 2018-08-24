Extension { #name : #TClass }

{ #category : #'*GToolkit-Examples-UI' }
TClass >> gtInspectorGTExamplesIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list 
		title: 'Examples';
		display: [ self gtExamples ];
		icon: [:each | each icon];
		format: [ :each | each gtDisplayString ] ;
		send: [ :each | each returnValue ];
		when: [ self gtExamples notEmpty ]
]

{ #category : #'*GToolkit-Examples-UI' }
TClass >> gtSpotterGTExamplesFor: aStep [
	<spotterOrder: 100>
	aStep listProcessor
		title: 'Examples';
		items: [ self gtExamples ];
		itemName: [ :example | example gtDisplayString ];
		filter: GTFilterSubstring
]
