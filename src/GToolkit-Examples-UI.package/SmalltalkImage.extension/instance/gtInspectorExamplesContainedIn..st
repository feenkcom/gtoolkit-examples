*GToolkit-Examples-UI
gtInspectorExamplesContainedIn: composite
	<gtInspectorPresentationOrder: 0>
	composite table
		title: 'Examples';
		display: [ self gtExamplesContained ];
		column: 'Example' evaluated: [ :each | each gtDisplayString ];
		column: 'Subject' evaluated: [ :each | ', ' join: (each subjects collect: [:s | s gtDisplayString ]) ]