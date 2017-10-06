*GToolkit-Examples-UI
gtSpotterGTExampleSubjectsFor: aStep
	<spotterOrder: 4>
	self hasSubjects ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Example Subjects';
		items: [ self subjects asArray ];
		itemName: [ :subject | subject gtDisplayString ];
		filter: GTFilterSubstring