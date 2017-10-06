private
buildArgument: anExample1 at: index parent: anExample2
	| shape element parentNode edge line |
	(nodes includesKey: anExample1) 
		ifTrue: [ 
			" retrieve existing element and shape"
			element := (nodes at: anExample1) first.
			shape := (nodes at: anExample1) second. ]
		ifFalse: [ 
			" add element and shape "
			shape := RTEllipse new 
				width: 8;
				height: 8;
				color: Color white;
				borderColor: (Color black alpha: 0.05);
				borderWidth: 2;
				yourself.
			element := shape elementOn: anExample1.
			group add: element.
			nodes at: anExample1 put: { element. shape } ].
	
	" add edge if not already present "
	self edgeFrom: anExample2 to: anExample1 ifAbsent: [ 
		parentNode := nodes at: anExample2.
		edge := RTEdge from: parentNode first to: element.
		line := RTArrowedLine new 
			color: Color yellow; 
			attachPoint: RTVerticalAttachPoint instance;
			yourself.
		edge + line.
		edges add: edge ]