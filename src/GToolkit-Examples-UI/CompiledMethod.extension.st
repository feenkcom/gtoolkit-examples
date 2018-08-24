Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Examples-UI' }
CompiledMethod >> gtSpotterGTExamplesFor: aStep [
	<spotterOrder: 12>
	aStep listProcessor
		title: 'Examples';
		items: [ self gtExamples ];
		filter: GTFilterSubstring
]
