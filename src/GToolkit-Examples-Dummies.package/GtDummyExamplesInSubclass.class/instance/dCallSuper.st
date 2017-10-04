examples
dCallSuper
	<gtExample>
	|dCallSuper|
	dCallSuper := super dCallSuper + 1.
	
	self assert: self gtExampleContext example directDependencies size equals: 1.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class superclass compiledMethodAt: thisContext selector).
	
	^ dCallSuper