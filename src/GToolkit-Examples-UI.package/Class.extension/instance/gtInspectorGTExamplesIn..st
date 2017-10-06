*GToolkit-Examples-UI
gtInspectorGTExamplesIn: composite
	<gtInspectorPresentationOrder: 40>

	<localClassMethod> 
   "This method is supposed to be local in Class because of a good reason.
   We use this pragma to test if Class does not contain some accidental 
   local selectors."

	composite list 
		title: 'Examples';
		display: [ self gtExamples ];
		icon: [:each | each icon];
		format: [:each | each gtDisplayString ];
		in: [ :list | list sorted: [ :a :b | (list format cull: a) < (list format cull: b)] ];
		send: [ :each | each returnValue ];
		when: [ self gtExamples notEmpty ]