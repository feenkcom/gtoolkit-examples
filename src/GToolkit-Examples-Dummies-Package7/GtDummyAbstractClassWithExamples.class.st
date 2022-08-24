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
	^ 0
]

{ #category : #examples }
GtDummyAbstractClassWithExamples >> exampleOne [
	<gtExample>
	| aValue |
	aValue := self basicValue.
	self assert: aValue isNotNil description: [ 'Value must be non-nil' ].
	^ aValue
]
