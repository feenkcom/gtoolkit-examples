Class {
	#name : #GtExamplesParametrizedExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #'examples - groups' }
GtExamplesParametrizedExamples >> allExamplesFromClassA [
	<gtExample>
	| anExamples | 
	anExamples := self exampleFactoryForClassA gtExamplesAllContained.
	self assertExamples: anExamples withSelectors: #( parametrizedExample: ).
	^ anExamples
	
]

{ #category : #assertions }
GtExamplesParametrizedExamples >> assertExampleFactory: anExampleFactory forClass: aSourceClass [
	self assert: anExampleFactory sourceClass equals: aSourceClass.
	self assert: anExampleFactory exampleClass equals: GtExample.
]

{ #category : #assertions }
GtExamplesParametrizedExamples >> assertExamples: currentExamples withSelectors: expectedSelectors [
	| obtainedSelectors |
	obtainedSelectors := (currentExamples collect: #selector) asArray sorted: [ :a :b | a < b ].
	self assert: obtainedSelectors size equals: expectedSelectors size.
	self assert: obtainedSelectors equals: expectedSelectors.
]

{ #category : #assertions }
GtExamplesParametrizedExamples >> assertParametrizedExample: example inClass: aMethodClass withProvider: aProviderClass [
	self assert: example class equals: GtExample.
	self assert: example providerContext class equals: GtExampleParametrizedProviderContext.
	self assert: example providerContext providerClass equals: aProviderClass.
	self assert: example providerClass equals: aProviderClass.
	self assert: example methodClass equals: aMethodClass.
	self assert: example provider class equals: aProviderClass.
	self assert: example hasValidProviderClass.
	self assert: example isValid.
	self assert: example exists.
]

{ #category : #'examples - factories' }
GtExamplesParametrizedExamples >> exampleFactoryForClassA [
	<gtExample>
	| anExampleFactory | 
	anExampleFactory := GtDummyExamplesWithParametrizedExampleA gtExamplesFactory.
	self assertExampleFactory: anExampleFactory forClass: GtDummyExamplesWithParametrizedExampleA.
	^ anExampleFactory
]

{ #category : #'examples - standalone' }
GtExamplesParametrizedExamples >> exampleInClassA [
	<gtExample>
	| anExample |
	anExample := self allExamplesFromClassA detect: [ :each | 
		each selector = #parametrizedExample: ].
	self assertParametrizedExample: anExample 
		inClass: GtDummyExamplesWithParametrizedExampleA 
		withProvider: GtDummyExamplesWithParametrizedExampleA.
	self assert: anExample providerContext arguments equals: #( 42 ).
	^ anExample
]

{ #category : #'examples - results' }
GtExamplesParametrizedExamples >> resultOfExampleInClassA [
	<gtExample>
	| aResult |
	aResult := self exampleInClassA result.
	self assert: aResult returnValue equals: 84.
	self assert: aResult hasException not.
	^ aResult
]
