private
updateDependency: anExampleOrMethod1 at: index parent: anExampleOrMethod2
	| node parentNode edge line |
	
	" abort if we've done this already "
	self edgeFrom: anExampleOrMethod2 to: anExampleOrMethod1 ifAbsent: [ 
		" retrieve existing elements "
		node := nodes at: anExampleOrMethod1.
		parentNode := nodes at: anExampleOrMethod2.
		
		" add edge "
		edge := RTEdge from: parentNode first to: node first.
		line := RTArrowedLine new 
			color: Color red; 
			attachPoint: RTVerticalAttachPoint instance;
			yourself.
		edge + line.
		edges add: edge ]