Class {
	#name : #GtDummyAbstractClassWithExamples,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Dummies-Package7'
}

{ #category : #testing }
GtDummyAbstractClassWithExamples class >> isAbstract [
	^ self name = #GtDummyAbstractClassWithExamples
]

{ #category : #examples }
GtDummyAbstractClassWithExamples >> basicValue [
	<gtExample>
	<return: #SmallInteger>
	^ 0
]

{ #category : #examples }
GtDummyAbstractClassWithExamples >> exampleOne [
	<gtExample>
	<return: #SmallInteger>
	| aValue |
	aValue := self basicValue.
	self assert: aValue isNotNil description: [ 'Value must be non-nil' ].
	^ aValue
]
