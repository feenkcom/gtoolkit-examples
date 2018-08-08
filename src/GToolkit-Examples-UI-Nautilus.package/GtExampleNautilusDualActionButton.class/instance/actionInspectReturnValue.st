private
actionInspectReturnValue
	^ IconicButton new
		target: self;
		actionSelector: #inspectReturnValue:;
		arguments: { method };
		color: Color transparent;
		helpText: 'Inspect Return-Value';
		extent: 16 @ 8;
		borderWidth: 0