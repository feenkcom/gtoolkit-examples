Class {
	#name : #GtDummyExamplesWithParametrizedExampleA,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Dummies-Package5'
}

{ #category : #accessing }
GtDummyExamplesWithParametrizedExampleA >> normalExample [
	<gtExample>
	^ 108
]

{ #category : #'parametrized examples' }
GtDummyExamplesWithParametrizedExampleA >> parametrizedExample: aNumber [
	<gtExample>
	<defaultValue: 21>
	| aResult |
	aResult := aNumber * 2.
	self assert: aResult isNotNil.
	^ aResult
]

{ #category : #'parametrized examples' }
GtDummyExamplesWithParametrizedExampleA >> parametrizedExample: aNumber withTwoArguments: anotherNumber [
	<gtExample>
	<defaultValue: 40>
	<defaultValue: 2>
	| aResult |
	aResult := aNumber + anotherNumber.
	self assert: aResult isNotNil.
	^ aResult
]
