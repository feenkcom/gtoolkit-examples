*GToolkit-Examples-UI
gtInspectorSubjectsIn: composite
	<gtInspectorPresentationOrder: 4>
	self hasSubjects ifFalse: [ ^ self ].
	^ (self subjects gtInspectorItemsIn: composite)
			title: 'Subjects'