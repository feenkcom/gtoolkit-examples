Class {
	#name : #GtDummyExamplesOnClassSide,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesOnClassSide class >> a [
	<gtExample>
	<label: 'Dummy #a'>
	<description: 'should return true'>
	
	^ true
]

{ #category : #examples }
GtDummyExamplesOnClassSide class >> b [
	<gtExample>
	<label: 'Dummy #b, depends #a'>
	<description: 'should return false'>
	
	^ self a & false
]

{ #category : #examples }
GtDummyExamplesOnClassSide class >> c [
	<gtExample>
	<label: 'Dummy #c, depends #b'>
	<description: 'should return true'>
	
	^ self b | true
]

{ #category : #examples }
GtDummyExamplesOnClassSide class >> ppp [
	<gtExample>
	<label: 'Dummy #ppp, depends #a, #b, #c'>
	<description: 'with description only'>
	| aBoolean1 aBoolean2 aBoolean3 |
	
	aBoolean1 := self a.
	aBoolean2 := self b.
	aBoolean3 := self c.
	
	self assert: (aBoolean1 | aBoolean2 | aBoolean3).
	^ aBoolean1 | aBoolean2 | aBoolean3
]
