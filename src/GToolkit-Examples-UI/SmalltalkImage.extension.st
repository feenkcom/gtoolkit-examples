Extension { #name : #SmalltalkImage }

{ #category : #'*GToolkit-Examples-UI' }
SmalltalkImage >> gtInspectorExamplesContainedIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite table
		title: 'Examples';
		display: [ self gtExamplesContained ];
		column: 'Example' evaluated: [ :each | each gtDisplayString ];
		column: 'Subject' evaluated: [ :each | ', ' join: (each subjects collect: [:s | s gtDisplayString ]) ]
]

{ #category : #'*GToolkit-Examples-UI' }
SmalltalkImage >> gtSpotterGTExamplesFor: aStep [
	<spotterOrder: 100>
	aStep listProcessor
		title: 'Examples';
		allCandidates: [ self gtExamplesContained asSet ];
		itemName: [ :example | example gtDisplayString ];
		filter: GTFilterSubstring
]
