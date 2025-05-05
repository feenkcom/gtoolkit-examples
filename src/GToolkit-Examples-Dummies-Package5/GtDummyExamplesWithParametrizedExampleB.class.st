Class {
	#name : #GtDummyExamplesWithParametrizedExampleB,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Dummies-Package5'
}

{ #category : #'parametrized examples' }
GtDummyExamplesWithParametrizedExampleB >> ignoringParameterExample: aNumber [
	<gtExample>
	^ 1
]

{ #category : #accessing }
GtDummyExamplesWithParametrizedExampleB >> normalExample [
	<gtExample>
	<return: #SmallInteger>
	^ 108 * (self ignoringParameterExample: 0)
]

{ #category : #'parametrized examples' }
GtDummyExamplesWithParametrizedExampleB >> parametrizedExample: aNumber withTwoArgumentsAndParametrizedExampleDependency: anotherNumber [
	<gtExample>
	| aResult |
	aResult := (self parametrizedExampleWithNormalExampleDependency: aNumber) + anotherNumber.
	self assert: aResult isNotNil.
	^ aResult
]

{ #category : #'parametrized examples' }
GtDummyExamplesWithParametrizedExampleB >> parametrizedExampleWithNormalExampleDependency: aNumber [
	<gtExample>
	| aResult theDependencies |
	aResult := self normalExample * 2.
	self assert: aResult isNotNil.
	theDependencies := self gtExampleRuntimeContext example directDependencies.
	self assert: theDependencies size equals: 1. 
	^ aResult
]
