*GToolkit-Examples-UI
gtInspectorAfterIn: composite
	<gtInspectorPresentationOrder: 3>
	self hasAfter ifFalse: [ ^ self ].
	^ ({ self after } gtInspectorItemsIn: composite)
			title: 'After'