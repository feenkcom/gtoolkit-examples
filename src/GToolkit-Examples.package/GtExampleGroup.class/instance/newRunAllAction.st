instance creation
newRunAllAction
	^ GLMGenericAction new
				action: [ :wrapper | 
						self examples do: [ :each | each ignoreTest ifFalse: [ each run ] ] 
							displayingProgress: 'Running examples ...'.
						wrapper update ]; 
				shortcut: $R; 
				showTitle: 'Run all';
				iconName: #testGreen;
				yourself