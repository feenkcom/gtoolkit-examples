examples
hSelfCallToMethodFromSuperclass
	<gtExample>
	| result |
	
	result := self aSuperclass.
	
	self assert: self gtExampleContext example directDependencies size equals: 1.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class superclass lookupSelector: #aSuperclass).

	^ result