*GToolkit-Examples-Roassal2UI
gtInspectorRoassalIn: composite
	<gtInspectorPresentationOrder: 1>
	self flag: 'Temporary solution in case rossal is not present'.
	(composite class canPerform: #roassal2) ifFalse: [ ^ self ].
	^ composite roassal2
		title: 'Graph';
		painting: [ :view :example | 
			"(GTExampleGraphPainter new 
				example: example;
				view: view;
				yourself) paint" ];
		when: [ self hasDependencies or: [ self hasDependents ] ]