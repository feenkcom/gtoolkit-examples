asserting
testResolve
	self assertClass: 'Object' meta: false resolvedAsClass: Object.
	self assertClass: 'Object' meta: true resolvedAsClass: Object class.
	
	self assertClass: #Object meta: false resolvedAsClass: Object.
	self assertClass: #Object meta: true resolvedAsClass: Object class.