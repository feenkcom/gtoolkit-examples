Class {
	#name : #GtDummyExampleWithAssertions,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExampleWithAssertions >> a [
	<gtExample>
	^ true
]

{ #category : #examples }
GtDummyExampleWithAssertions >> b [
	<gtExample>
	^ true
]

{ #category : #examples }
GtDummyExampleWithAssertions >> c [
	<gtExample>
	| a b |
	a := self a.
	b := self b.
	self assert: a = b.
	^ a & b
]
