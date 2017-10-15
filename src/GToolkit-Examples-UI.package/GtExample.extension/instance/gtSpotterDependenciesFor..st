*GToolkit-Examples-UI
gtSpotterDependenciesFor: aStep
	<spotterOrder: 1>
	self hasDependencies ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Example Dependencies';
		items: [ self directDependencies ];
		itemName: [ :example | example gtDisplayString ];
		filter: GTFilterSubstring