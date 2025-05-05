Class {
	#name : #GtDummyExamplesInSubclass,
	#superclass : #GtDummyExamplesSuperclass,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesInSubclass >> bInBoth [
	<gtExample>
	<return: #SmallInteger>
	^ 2
]

{ #category : #examples }
GtDummyExamplesInSubclass >> cSubclass [
	<gtExample>
	<return: #SmallInteger>
	^ 1
]

{ #category : #examples }
GtDummyExamplesInSubclass >> dCallSuper [
	<gtExample>
	<return: #SmallInteger>
	| dCallSuper |
	dCallSuper := super dCallSuper + 1.

	self
		assert: self gtExampleRuntimeContext example directDependencies size
		equals: 1.
	self
		assert: self gtExampleRuntimeContext example directDependencies first method
		equals: (self class superclass compiledMethodAt: thisContext selector).

	^ dCallSuper
]

{ #category : #examples }
GtDummyExamplesInSubclass >> eCallToDifferentSuper [
	<gtExample>
	<return: #GtDummyExamplesInSubclass>
	| result |
	result := super dCallSuper + 1.

	self
		assert: self gtExampleRuntimeContext example directDependencies size
		equals: 1.
	self
		assert: self gtExampleRuntimeContext example directDependencies first method
		equals: (self class superclass compiledMethodAt: #dCallSuper)
]

{ #category : #examples }
GtDummyExamplesInSubclass >> eTwoCallsToSameSuperclassMethodWithSameSelector [
	<gtExample>
	<return: #SmallInteger>
	| result dependency |
	result := super aSuperclass + self aSuperclass.

	self
		assert: self gtExampleRuntimeContext example directDependencies size
		equals: 1.

	dependency := self gtExampleRuntimeContext example directDependencies first.
	self
		assert: dependency method
		equals: (self class lookupSelector: #aSuperclass).
	self assert: dependency providerClass equals: self class.
	self assert: dependency methodClass equals: self class superclass.

	^ result
]

{ #category : #examples }
GtDummyExamplesInSubclass >> fTwoCallsToDifferentMethodsWithSameSelector [
	<gtExample>
	<return: #SmallInteger>
	| result |
	result := super bInBoth + self bInBoth.

	self
		assert: self gtExampleRuntimeContext example directDependencies size
		equals: 2.
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
	<return: #SmallInteger>
	| result |
	result := super aSuperclass + self bInBoth.

	self
		assert: self gtExampleRuntimeContext example directDependencies size
		equals: 2.
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
	<return: #SmallInteger>
	| result dependency |
	result := self aSuperclass.

	self
		assert: self gtExampleRuntimeContext example directDependencies size
		equals: 1.

	dependency := self gtExampleRuntimeContext example directDependencies first.

	self
		assert: dependency method
		equals: (self class lookupSelector: #aSuperclass).
	self assert: dependency providerClass equals: self class.
	self assert: dependency methodClass equals: self class superclass.

	^ result
]

{ #category : #examples }
GtDummyExamplesInSubclass >> iSuperCallHavingASelfCallToMethodInThisClassWithAfterOnlyInSubclass [
	<gtExample>
	<return: #SmallInteger>
	| result dependency secondDependency |
	result := super iCallToSelfJ.

	self
		assert: self gtExampleRuntimeContext example directDependencies size
		equals: 1.

	dependency := self gtExampleRuntimeContext example directDependencies first.
	self
		assert: dependency method
		equals: (self class lookupSelector: #iCallToSelfJ).

	self assert: dependency directDependencies size equals: 1.
	secondDependency := dependency directDependencies first.
	self
		assert: secondDependency method
		equals: self class >> #jMethodInBothWithAfterInSubclass.
	self assert: secondDependency after method equals: self class >> #jAfter.

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
	<return: #SmallInteger>
	^ 2
]
