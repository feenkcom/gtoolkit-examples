Class {
	#name : #GtDummyExamplesInSubclass,
	#superclass : #GtDummyExamplesSuperclass,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesInSubclass >> bInBoth [
	<gtExample>
	^ 2
]

{ #category : #examples }
GtDummyExamplesInSubclass >> cSubclass [
	<gtExample>
	^ 1
]

{ #category : #examples }
GtDummyExamplesInSubclass >> dCallSuper [
	<gtExample>
	|dCallSuper|
	dCallSuper := super dCallSuper + 1.
	
	self assert: self gtExampleContext example directDependencies size equals: 1.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class superclass compiledMethodAt: thisContext selector).
	
	^ dCallSuper
]

{ #category : #examples }
GtDummyExamplesInSubclass >> eCallToDifferentSuper [
	<gtExample>
	| result |
	
	result := super dCallSuper + 1.
	
	self assert: self gtExampleContext example directDependencies size equals: 1.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class superclass compiledMethodAt: #dCallSuper).
	

]

{ #category : #examples }
GtDummyExamplesInSubclass >> eTwoCallsToSameSuperclassMethodWithSameSelector [
	<gtExample>
	| result |
	
	result := super aSuperclass + self aSuperclass.
	
	self assert: self gtExampleContext example directDependencies size equals: 1.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class lookupSelector: #aSuperclass).

	^ result
]

{ #category : #examples }
GtDummyExamplesInSubclass >> fTwoCallsToDifferentMethodsWithSameSelector [
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
]

{ #category : #examples }
GtDummyExamplesInSubclass >> gCallsToDifferentSelfAndSuperMethods [
	<gtExample>
	| result |
	
	result := super aSuperclass + self bInBoth.
	
	self assert: self gtExampleContext example directDependencies size equals: 2.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class superclass lookupSelector: #aSuperclass).
		self 
		assert: self gtExampleContext example directDependencies second method 
		equals: (self class lookupSelector: #bInBoth).

	^ result
]

{ #category : #examples }
GtDummyExamplesInSubclass >> hSelfCallToMethodFromSuperclass [
	<gtExample>
	| result |
	
	result := self aSuperclass.
	
	self assert: self gtExampleContext example directDependencies size equals: 1.
	self 
		assert: self gtExampleContext example directDependencies first method 
		equals: (self class superclass lookupSelector: #aSuperclass).

	^ result
]
