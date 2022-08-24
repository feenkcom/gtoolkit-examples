Class {
	#name : #GtExamplesProvidingExampleWithResultExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples-GToolkit-Tests-Examples'
}

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> allExamplesOfClass: aClass expectedAmount: anAmount [
	<gtExample>
	| allExamples |
	allExamples := aClass gtExamplesAll.

	self assert: allExamples size equals: anAmount.

	allExamples
		do: [ :eachExample | 
			eachExample selector = self exampleOneSelector
				ifTrue: [ self assert: eachExample methodClass equals: self rootClass ]
				ifFalse: [ self assert: eachExample methodClass equals: aClass ] ].

	allExamples
		do: [ :eachExample | self assert: eachExample providerClass equals: aClass ].

	^ allExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> exampleOneSelector [
	<gtExample>
	^ #exampleOne
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> intermediateClass [
	<gtExample>
	^ GtDummyIntermediateClassWithExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> intermediateClassAllExamples [
	<gtExample>
	^ self allExamplesOfClass: self intermediateClass expectedAmount: 2
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> intermediateClassExampleOneWithResult [
	<gtExample>
	<noTest>
	| anExample anExampleWithResultOne anExampleWithResultTwo |
	anExample := self intermediateClassAllExamples
			detect: [ :eachExample | eachExample selector = self exampleOneSelector ].

	anExampleWithResultOne := anExample asCachedExampleWithResult.
	anExampleWithResultTwo := anExample asCachedExampleWithResult.

	self assert: anExampleWithResultOne isNotNil.
	self assert: anExampleWithResultOne == anExampleWithResultTwo.

	^ anExampleWithResultOne
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassOne [
	<gtExample>
	^ GtDummyLeafClassOneWithExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassOneAllExamples [
	<gtExample>
	^ self allExamplesOfClass: self leafClassOne expectedAmount: 2
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassOneExampleOneWithResult [
	<gtExample>
	<noTest>
	| anExample anExampleWithResultOne anExampleWithResultTwo |
	anExample := self leafClassOneAllExamples
			detect: [ :eachExample | eachExample selector = self exampleOneSelector ].

	anExampleWithResultOne := anExample asCachedExampleWithResult.
	anExampleWithResultTwo := anExample asCachedExampleWithResult.

	self assert: anExampleWithResultOne isNotNil.
	self assert: anExampleWithResultOne == anExampleWithResultTwo.

	^ anExampleWithResultOne
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassTwo [
	<gtExample>
	^ GtDummyLeafClassTwoWithExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassTwoAllExamples [
	<gtExample>
	^ self allExamplesOfClass: self leafClassTwo expectedAmount: 2
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassTwoExampleOneWithResult [
	<gtExample>
	<noTest>
	| anExample anExampleWithResultOne anExampleWithResultTwo |
	anExample := self leafClassTwoAllExamples
			detect: [ :eachExample | eachExample selector = self exampleOneSelector ].

	anExampleWithResultOne := anExample asCachedExampleWithResult.
	anExampleWithResultTwo := anExample asCachedExampleWithResult.

	self assert: anExampleWithResultOne isNotNil.
	self assert: anExampleWithResultOne == anExampleWithResultTwo.
	self assert: anExampleWithResultOne example == anExample.
	self
		assert: anExampleWithResultOne example providerClass
		equals: self leafClassTwo.

	^ anExampleWithResultOne
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClass [
	<gtExample>
	^ GtDummyAbstractClassWithExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClassAllExamples [
	<gtExample>
	^ self allExamplesOfClass: self rootClass expectedAmount: 2
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClassExampleOne [
	<gtExample>
	| aClass allExamples |
	aClass := self rootClass.
	allExamples := aClass gtExamplesAll.

	self assert: allExamples size equals: 2.

	^ allExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClassExampleOneWithResult [
	<gtExample>
	| anExample anExampleWithResultOne anExampleWithResultTwo |
	anExample := self rootClassAllExamples
			detect: [ :eachExample | eachExample selector = self exampleOneSelector ].

	anExampleWithResultOne := anExample asCachedExampleWithResult.
	anExampleWithResultTwo := anExample asCachedExampleWithResult.

	self assert: anExampleWithResultOne isNotNil.
	self assert: anExampleWithResultOne == anExampleWithResultTwo.

	^ anExampleWithResultOne
]
