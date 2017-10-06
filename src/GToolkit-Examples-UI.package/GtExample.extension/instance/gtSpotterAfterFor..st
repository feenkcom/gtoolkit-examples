*GToolkit-Examples-UI
gtSpotterAfterFor: aStep
	<spotterOrder: 3>
	self hasAfter ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Example After';
		items: [ { self after } ];
		itemName: [ :example | example gtDisplayString ];
		filter: GTFilterSubstring