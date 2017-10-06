private
updateDependent: anExampleOrMethod1 child: anExampleOrMethod2
	| node parentNode edge line |
	
	" abort if we've done this already "
	self edgeFrom: anExampleOrMethod1 to: anExampleOrMethod2 ifAbsent: [ 
		" retrieve existing elements "
		node := nodes at: anExampleOrMethod2.
		parentNode := nodes at: anExampleOrMethod1.
		
		" add edge "
		edge := RTEdge from: parentNode first to: node first.
		line := RTArrowedLine new 
			color: Color red; 
			attachPoint: RTVerticalAttachPoint instance;
			yourself.
		edge + line.
		edges add: edge ]