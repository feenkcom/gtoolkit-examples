Class {
	#name : #GtDummyExamplesSuperclass,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesSuperclass >> aSuperclass [
	<gtExample>
	<return: #SmallInteger>
	^ 1
]

{ #category : #examples }
GtDummyExamplesSuperclass >> bInBoth [
	<gtExample>
	<return: #SmallInteger>
	^ 1
]

{ #category : #examples }
GtDummyExamplesSuperclass >> dCallSuper [
	"The example here is mean to be override and called from a subclass"

	<gtExample>
	<return: #SmallInteger>
	^ 1
]

{ #category : #examples }
GtDummyExamplesSuperclass >> iCallToSelfJ [
	<gtExample>
	<return: #SmallInteger>
	^ self jMethodInBothWithAfterInSubclass
]

{ #category : #examples }
GtDummyExamplesSuperclass >> iSuperCallHavingASelfCallToMethodInThisClassWithAfterOnlyInSubclass [
	<gtExample>
	<return: #SmallInteger>
	| result dependency secondDependency |
	result := self iCallToSelfJ.

	self
		assert: self gtExampleRuntimeContext example directDependencies size
		equals: 1.

	dependency := self gtExampleRuntimeContext example directDependencies first.
	self assert: dependency method equals: self class >> #iCallToSelfJ.

	self assert: dependency directDependencies size equals: 1.
	secondDependency := dependency directDependencies first.
	self
		assert: secondDependency method
		equals: self class >> #jMethodInBothWithAfterInSubclass.
	self assert: secondDependency after equals: nil.

	^ result
]

{ #category : #examples }
GtDummyExamplesSuperclass >> jMethodInBothWithAfterInSubclass [
	<gtExample>
	<return: #SmallInteger>
	^ 2
]
