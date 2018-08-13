*GToolkit-Examples-UI
gtActionSubjects
	<gtAction>
	^ [ BrButton new 
			look: BrMaterialToggleLabelledLook;
			icon: (Smalltalk ui icons iconNamed: #glamorousBookmark);
			action: [ GtExampleNavigation browseAllExampleSubjects: { self } ] 
		]