*GToolkit-Examples-UI
gtInspectorActionSubjects
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ GtExampleNavigation browseAllExampleSubjects: { self } ];
		icon: (Smalltalk ui icons iconNamed: #glamorousBookmark);
		title: 'Subjects'