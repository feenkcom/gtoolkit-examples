*GToolkit-Examples-UI
gtInspectorGTExamplesIn: composite
	<gtInspectorPresentationOrder: 40>
	composite list 
		title: 'Examples';
		display: [ self gtExamples ];
		icon: [:each | each icon];
		format: [ :each | each gtDisplayString ] ;
		send: [ :each | each returnValue ];
		when: [ self gtExamples notEmpty ]