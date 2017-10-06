*GToolkit-Examples-UI
gtSpotterMethodFor: aStep
	<spotterOrder: 0>
	self exists ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Method';
		items: [ Array with: self method ];
		itemName: [ :aSource | aSource gtDisplayString ];
		filter: GTFilterSubstring