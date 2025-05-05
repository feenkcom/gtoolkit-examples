Class {
	#name : #GtDummyExampleWithAssertions,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExampleWithAssertions >> a [
	<gtExample>
	<return: #True>
	^ true
]

{ #category : #examples }
GtDummyExampleWithAssertions >> b [
	<gtExample>
	<return: #True>
	^ true
]

{ #category : #examples }
GtDummyExampleWithAssertions >> c [
	<gtExample>
	<return: #True>
	| a b |
	a := self a.
	b := self b.
	self assert: a = b.
	^ a & b
]
