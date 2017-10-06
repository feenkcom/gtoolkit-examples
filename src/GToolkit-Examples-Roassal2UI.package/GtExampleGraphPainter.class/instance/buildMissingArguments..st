private
buildMissingArguments: anExample1
	| method |
	
	" abort if we've done this already "
	method := anExample1 method.
	method numArgs > anExample1 arguments size ifFalse: [ ^ self ].
	
	(1 max: anExample1 arguments size) to: method numArgs  do: [ :index |
		| shape argumentName element edge line |
		" add shape "
		shape := RTEllipse new 
			width: 8;
			height: 8;
			color: Color white;
			borderWidth: 2;
			yourself.
		argumentName := method argumentNames at: index.
		element := shape elementOn: argumentName asString.
		group add: element.
		
		" add edge "
		edge := RTEdge from: (nodes at: anExample1) first to: element.
		line := RTArrowedLine new 
			color: Color yellow; 
			attachPoint: RTVerticalAttachPoint instance;
			yourself.
		edge + line.
		edges add: edge ]