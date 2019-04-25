Class {
	#name : #GtDummyExamplesWithParametrizedExampleA,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Dummies-Package5'
}

{ #category : #'parametrized examples' }
GtDummyExamplesWithParametrizedExampleA >> parametrizedExample: aNumber [
	<gtExample>
	<value: 21>
	| aResult |
	aResult := aNumber * 2.
	self assert: aResult isNotNil.
	^ aResult
]

{ #category : #'parametrized examples' }
GtDummyExamplesWithParametrizedExampleA >> parametrizedExample: aNumber withTwoArguments: anotherNumber [
	<gtExample>
	<value: 40>
	<value: 2>
	| aResult |
	aResult := aNumber + anotherNumber.
	self assert: aResult isNotNil.
	^ aResult
]
