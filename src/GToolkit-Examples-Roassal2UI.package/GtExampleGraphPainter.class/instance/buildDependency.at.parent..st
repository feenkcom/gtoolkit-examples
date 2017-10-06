private
buildDependency: anExample1 at: index parent: anExample2
	| shape element parentNode edge line |
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
			nodes at: anExample1 put: { element. shape }.
			" add missing arguments "
			self buildMissingArguments: anExample1 ].
	
	" add edge if not already present "
	self edgeFrom: anExample2 to: anExample1 ifAbsent: [ 
		parentNode := nodes at: anExample2.
		edge := RTEdge from: parentNode first to: element.
		line := RTArrowedLine new 
			color: (index > anExample2 method numArgs 
				ifTrue: [ Color yellow ] 
				ifFalse: [ Color lightGray ]); 
			attachPoint: RTVerticalAttachPoint instance;
			yourself.
		edge + line.
		edges add: edge ]