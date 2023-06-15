Class {
	#name : #GtDummyExamplesInSubclass,
	#superclass : #GtDummyExamplesSuperclass,
	#category : #'GToolkit-Examples-Dummies-Data'
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
	
	self assert: self gtExampleRuntimeContext example directDependencies size equals: 1.
	self 
		assert: self gtExampleRuntimeContext example directDependencies first method 
		equals: (self class superclass compiledMethodAt: thisContext selector).
	
	^ dCallSuper
]

{ #category : #examples }
GtDummyExamplesInSubclass >> eCallToDifferentSuper [
	<gtExample>
	| result |
	
	result := super dCallSuper + 1.
	
	self assert: self gtExampleRuntimeContext example directDependencies size equals: 1.
	self 
		assert: self gtExampleRuntimeContext example directDependencies first method 
		equals: (self class superclass compiledMethodAt: #dCallSuper).
	

]

{ #category : #examples }
GtDummyExamplesInSubclass >> eTwoCallsToSameSuperclassMethodWithSameSelector [
	<gtExample>
	| result dependency |
	
	result := super aSuperclass + self aSuperclass.
	
	self 
		assert: self gtExampleRuntimeContext example directDependencies size 
		equals: 1.
	
	dependency := self gtExampleRuntimeContext example directDependencies first.
	self 
		assert:  dependency method 
		equals: (self class lookupSelector: #aSuperclass).
	self 
		assert:  dependency providerClass  
		equals: self class.
	self 
		assert:  dependency methodClass  
		equals: self class superclass.

	^ result
]

{ #category : #examples }
GtDummyExamplesInSubclass >> fTwoCallsToDifferentMethodsWithSameSelector [
	<gtExample>
	| result |
	
	result := super bInBoth + self bInBoth.
	
	self assert: self gtExampleRuntimeContext example directDependencies size equals: 2.
	self 
		assert: self gtExampleRuntimeContext example directDependencies first method 
		equals: (self class superclass lookupSelector: #bInBoth).
		self 
		assert: self gtExampleRuntimeContext example directDependencies second method 
		equals: (self class lookupSelector: #bInBoth).

	^ result
]

{ #category : #examples }
GtDummyExamplesInSubclass >> gCallsToDifferentSelfAndSuperMethods [
	<gtExample>
	| result |
	
	result := super aSuperclass + self bInBoth.
	
	self assert: self gtExampleRuntimeContext example directDependencies size equals: 2.
	self 
		assert: self gtExampleRuntimeContext example directDependencies first method 
		equals: (self class superclass lookupSelector: #aSuperclass).
	self 
		assert: self gtExampleRuntimeContext example directDependencies second method 
		equals: (self class lookupSelector: #bInBoth).

	^ result
]

{ #category : #examples }
GtDummyExamplesInSubclass >> hSelfCallToMethodFromSuperclass [
	<gtExample>
	| result dependency |
	
	result := self aSuperclass.
	
	self 
		assert: self gtExampleRuntimeContext example directDependencies size 
		equals: 1.
		
	dependency := self gtExampleRuntimeContext example directDependencies first.
	
	self 
		assert:  dependency method 
		equals: (self class lookupSelector: #aSuperclass).
	self 
		assert:  dependency providerClass  
		equals: self class.
	self 
		assert:  dependency methodClass  
		equals: self class superclass.

	^ result
]

{ #category : #examples }
GtDummyExamplesInSubclass >> iSuperCallHavingASelfCallToMethodInThisClassWithAfterOnlyInSubclass [
	<gtExample>
	| result dependency secondDependency |
	
	result := super iCallToSelfJ.
	
	self 
		assert: self gtExampleRuntimeContext example directDependencies size 
		equals: 1.
		
	dependency := self gtExampleRuntimeContext example directDependencies first.
	self 
		assert:  dependency method 
		equals: (self class lookupSelector: #iCallToSelfJ).
		
	self assert: dependency directDependencies size equals: 1.
	secondDependency := dependency directDependencies first.
	self 
		assert: secondDependency method
		equals: (self class >> #jMethodInBothWithAfterInSubclass).
	self 
		assert: secondDependency after method
		equals: (self class >> #jAfter).
	
	^ result
]

{ #category : #accessing }
GtDummyExamplesInSubclass >> jAfter [
	^ 1
]

{ #category : #examples }
GtDummyExamplesInSubclass >> jMethodInBothWithAfterInSubclass [
	<gtExample>
	<after: #jAfter>
	^ 2
]
