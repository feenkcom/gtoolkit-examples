*GToolkit-Examples-UI
gtSpotterProblemsFor: aStep
	<spotterOrder: 5>
	self hasProblems ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Example Problems';
		items: [ self problems ];
		itemName: [ :problem | problem gtDisplayString ];
		filter: GTFilterSubstring