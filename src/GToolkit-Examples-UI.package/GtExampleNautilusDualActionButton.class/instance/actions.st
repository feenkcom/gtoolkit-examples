private
actions
	| action1 action2 |
	^ result := ((Morph new
		extent: 16@16;
		color: Color transparent;
		borderWidth: 0;
		changeTableLayout;
		listDirection: #topToBottom;
		addMorph: (action1 := self actionInspectExample);
		addMorph: (action2 := self actionInspectReturnValue);
		yourself) -> { action1. action2 })