asserting
testResolveWithCompatibility
	self assertClass: 'Object class' meta: false resolvedAsClass: Object class.
	self assertClass: 'Object class' meta: true resolvedAsClass: Object class.
	
	self assertClass: #'Object class' meta: false resolvedAsClass: Object class.
	self assertClass: #'Object class' meta: true resolvedAsClass: Object class.
	