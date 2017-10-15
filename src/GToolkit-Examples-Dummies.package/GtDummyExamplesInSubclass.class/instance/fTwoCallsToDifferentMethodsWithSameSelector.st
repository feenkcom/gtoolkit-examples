examples
fTwoCallsToDifferentMethodsWithSameSelector
	<gtExample>
	| result |
	
	result := super bInBoth + self bInBoth.
	
	self assert: self gtExampleContext example directDependencies size equals: 2.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class superclass lookupSelector: #bInBoth).
		self 
		assert: self gtExampleContext example directDependencies second method 
		equals: (self class lookupSelector: #bInBoth).

	^ result