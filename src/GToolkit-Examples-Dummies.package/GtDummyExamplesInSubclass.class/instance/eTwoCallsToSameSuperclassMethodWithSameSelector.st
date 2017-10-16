examples
eTwoCallsToSameSuperclassMethodWithSameSelector
	<gtExample>
	| result |
	
	result := super aSuperclass + self aSuperclass.
	
	self assert: self gtExampleContext example directDependencies size equals: 1.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class lookupSelector: #aSuperclass).

	^ result