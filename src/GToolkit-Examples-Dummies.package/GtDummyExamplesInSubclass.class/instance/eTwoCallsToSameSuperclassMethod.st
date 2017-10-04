examples
eTwoCallsToSameSuperclassMethod
	<gtExample>
	| result |
	
	result := super aSuperclass + self aSuperclass.
	
	self assert: self gtExampleContext example directDependencies size equals: 2.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class lookupSelector: #aSuperclass).
		self 
		assert: self gtExampleContext example directDependencies second method 
		equals: (self class lookupSelector: #aSuperclass).

	^ result