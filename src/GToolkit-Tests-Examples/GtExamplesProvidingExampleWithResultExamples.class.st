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
	<return: #ByteSymbol>
	^ #exampleOne
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> intermediateClass [
	<gtExample>
	<return: #'GtDummyIntermediateClassWithExamples class'>
	^ GtDummyIntermediateClassWithExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> intermediateClassAllExamples [
	<gtExample>
	<return: #OrderedCollection>
	^ self allExamplesOfClass: self intermediateClass expectedAmount: 2
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> intermediateClassExampleOneWithResult [
	<gtExample>
	<return: #GtExampleWithResult>
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
	<return: #'GtDummyLeafClassOneWithExamples class'>
	^ GtDummyLeafClassOneWithExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassOneAllExamples [
	<gtExample>
	<return: #OrderedCollection>
	^ self allExamplesOfClass: self leafClassOne expectedAmount: 2
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassOneExampleOneWithResult [
	<gtExample>
	<return: #GtExampleWithResult>
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
	<return: #'GtDummyLeafClassTwoWithExamples class'>
	^ GtDummyLeafClassTwoWithExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassTwoAllExamples [
	<gtExample>
	<return: #OrderedCollection>
	^ self allExamplesOfClass: self leafClassTwo expectedAmount: 2
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> leafClassTwoExampleOneWithResult [
	<gtExample>
	<return: #GtExampleWithResult>
	| anExample anExampleWithResultOne anExampleWithResultTwo |
	anExample := self leafClassTwoAllExamples
			detect: [ :eachExample | eachExample selector = self exampleOneSelector ].
	anExample method clearExampleAndTestCaches.

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
GtExamplesProvidingExampleWithResultExamples >> numberOfRootClassPackageAllContainedExamples [
	^ 6
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClass [
	<gtExample>
	<return: #'GtDummyAbstractClassWithExamples class'>
	^ GtDummyAbstractClassWithExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClassAllExamples [
	<gtExample>
	<return: #OrderedCollection>
	^ self allExamplesOfClass: self rootClass expectedAmount: 2
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClassExampleOne [
	<gtExample>
	<return: #OrderedCollection>
	| aClass allExamples |
	aClass := self rootClass.
	allExamples := aClass gtExamplesAll.

	self assert: allExamples size equals: 2.

	^ allExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClassExampleOneWithResult [
	<gtExample>
	<return: #GtExampleWithResult>
	| anExample anExampleWithResultOne anExampleWithResultTwo |
	anExample := self rootClassAllExamples
			detect: [ :eachExample | eachExample selector = self exampleOneSelector ].

	anExampleWithResultOne := anExample asCachedExampleWithResult.
	anExampleWithResultTwo := anExample asCachedExampleWithResult.

	self assert: anExampleWithResultOne isNotNil.
	self assert: anExampleWithResultOne == anExampleWithResultTwo.

	^ anExampleWithResultOne
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClassPackage [
	<gtExample>
	<return: #Package>
	| aClass aPackage |
	aClass := self rootClass.
	aPackage := aClass package.

	self assert: aPackage isNotNil.

	^ aPackage
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClassPackageAllExamplesContained [
	<gtExample>
	<return: #OrderedCollection>
	| aPackage allExamples |
	aPackage := self rootClassPackage.
	allExamples := aPackage gtExamplesAllContained.

	self
		assert: allExamples isNotNil
		description: [ 'All examples must be non-nil' ].
	self
		assert: allExamples isNotEmpty
		description: [ 'All examples must be non-empty' ].
	self
		assert: allExamples size
		equals: self numberOfRootClassPackageAllContainedExamples.

	allExamples
		do: [ :anExampleOne | 
			allExamples
				do: [ :anExampleTwo | 
					anExampleOne == anExampleTwo
						ifFalse: [ self
								assert: anExampleOne ~= anExampleTwo
								description: [ 'Examples must be non-equal, currently {1} = {2}'
										format: {anExampleOne gtDisplayString.
												anExampleTwo gtDisplayString} ] ] ] ].

	^ allExamples
]

{ #category : #accessing }
GtExamplesProvidingExampleWithResultExamples >> rootClassPackageAllExamplesContained_AsExampleWithResult [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self rootClassPackageAllExamplesContained
			collect: [ :eachExample | eachExample asExampleWithResult ].

	self
		assert: allExamples isNotNil
		description: [ 'All examples must be non-nil' ].
	self
		assert: allExamples isNotEmpty
		description: [ 'All examples must be non-empty' ].
	self
		assert: allExamples size
		equals: self numberOfRootClassPackageAllContainedExamples.

	allExamples
		do: [ :anExampleOne | 
			allExamples
				do: [ :anExampleTwo | 
					anExampleOne == anExampleTwo
						ifFalse: [ self
								assert: anExampleOne ~= anExampleTwo
								description: [ 'Examples must be non-equal, currently {1} = {2}'
										format: {anExampleOne gtDisplayString.
												anExampleTwo gtDisplayString} ] ] ] ].

	^ allExamples
]
