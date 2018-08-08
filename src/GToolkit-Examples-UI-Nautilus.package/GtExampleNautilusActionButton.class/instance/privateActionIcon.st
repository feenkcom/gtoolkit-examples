order
privateActionIcon
	"Return the icon for this action"
	^ IconicButton new
		target: self;
		actionSelector: #run:;
		arguments: { method };
		labelGraphic: (self class iconForMethod: method result: nil);
		color: Color transparent;
		helpText: 'Run';
		extent: 16 @ 16;
		borderWidth: 0