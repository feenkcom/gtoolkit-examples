private
actionInspectExample
	^ IconicButton new
		target: self;
		actionSelector: #inspectExample:;
		arguments: { method };
		color: Color transparent;
		helpText: 'Inspect Example';
		extent: 16 @ 8;
		borderWidth: 0