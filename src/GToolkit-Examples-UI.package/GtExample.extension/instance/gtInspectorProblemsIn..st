*GToolkit-Examples-UI
gtInspectorProblemsIn: composite
	<gtInspectorPresentationOrder: 5>
	self hasProblems ifFalse: [ ^ self ].
	^ (self problems gtInspectorItemsIn: composite)
			title: 'Problems'