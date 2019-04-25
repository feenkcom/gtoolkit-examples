Class {
	#name : #GtDummyExamplesWithParametrizedExampleA,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Dummies-Package5'
}

{ #category : #'parametrized examples' }
GtDummyExamplesWithParametrizedExampleA >> parametrizedExample: aNumber [
	<gtExample>
	<value: 42>
	| aResult |
	aResult := aNumber * 2.
	self assert: aResult isNotNil.
	^ aResult
]
