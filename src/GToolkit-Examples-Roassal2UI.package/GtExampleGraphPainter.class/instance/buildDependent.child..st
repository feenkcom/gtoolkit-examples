private
buildDependent: anExample1 child: anExample2
	| shape element childNode edge line |
	(nodes includesKey: anExample1) 
		ifTrue: [ 
			" retrieve existing element and shape"
			element := (nodes at: anExample1) first.
			shape := (nodes at: anExample1) second. ]
		ifFalse: [
			" add element and shape "
			shape := RTEllipse new 
				width: 16;
				height: 16;
				color: (self example == anExample1 ifTrue: [ Color lightGray ] ifFalse: [ Color white ]);
				borderColor: (anExample1 hasInternalProblems
					ifTrue: [ Color yellow ]
					ifFalse: [ Color black ]);
				borderWidth: 2;
				yourself.
			element := shape elementOn: anExample1.
			group add: element.
			nodes at: anExample1 put: { element. shape } ].
	
	" add edge if not already present "
	self edgeFrom: anExample1 to: anExample2 ifAbsent: [ 
		childNode := nodes at: anExample2.
		edge := RTEdge from: element to: childNode first.
		line := RTArrowedLine new 
			color: Color lightGray; 
			attachPoint: RTVerticalAttachPoint instance;
			yourself.
		edge + line.
		edges add: edge ]