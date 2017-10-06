private
buildAfter: anExample1
	| shape element parentNode edge line |
	
	" abort if we've done this already "
	anExample1 after ifNil: [ ^ self ].
	(nodes includesKey: anExample1 after) ifTrue: [ ^ self ].
	
	" add element and shape "
	shape := RTEllipse new 
		width: 8;
		height: 8;
		color: Color white;
		borderColor: (anExample1 after isValid 
			ifTrue: [ Color black ]
			ifFalse: [ Color yellow alpha: 0.05 ]);
		borderWidth: 1;
		yourself.
	element := shape elementOn: anExample1.
	group add: element.
	nodes at: anExample1 after put: { element. shape }.
	
	" add edge "
	parentNode := nodes at: anExample1.
	edge := RTEdge from: parentNode first to: element.
	line := RTLine new 
		color: (anExample1 after isValid 
			ifTrue: [ Color black ]
			ifFalse: [ Color yellow ]); 
		attachPoint: RTVerticalAttachPoint instance;
		yourself.
	edge + line.
	edges add: edge