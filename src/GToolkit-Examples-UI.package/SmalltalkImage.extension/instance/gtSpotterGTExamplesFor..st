*GToolkit-Examples-UI
gtSpotterGTExamplesFor: aStep
	<spotterOrder: 100>
	aStep listProcessor
		title: 'Examples';
		allCandidates: [ self gtExamplesContained asSet ];
		itemName: [ :example | example gtDisplayString ];
		filter: GTFilterSubstring