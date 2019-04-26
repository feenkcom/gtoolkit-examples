Class {
	#name : #GtExamplesParametrizedExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #assertions }
GtExamplesParametrizedExamples >> assertExampleFactory: anExampleFactory forClass: aSourceClass [
	self assert: anExampleFactory sourceClass equals: aSourceClass.
	self assert: anExampleFactory exampleClass equals: GtParametrizedExample.
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
	self assert: example class equals: GtParametrizedExample.
	self assert: example providerClass equals: aProviderClass.
	self assert: example methodClass equals: aMethodClass.
	self assert: example provider class equals: aProviderClass.
	self assert: example hasValidProviderClass.
	self assert: example isValid.
	self assert: example exists.
]

{ #category : #'examples - factories' }
GtExamplesParametrizedExamples >> parametrizedExampleFactoryForClassA [
	<gtExample>
	| anExampleFactory | 
	anExampleFactory := GtDummyExamplesWithParametrizedExampleA gtParametrizedExamplesFactory.
	self assertExampleFactory: anExampleFactory forClass: GtDummyExamplesWithParametrizedExampleA.
	^ anExampleFactory
]

{ #category : #'examples - standalone' }
GtExamplesParametrizedExamples >> parametrizedExampleInClassA [
	<gtExample>
	| anExample |
	anExample := self parametrizedExamplesFromClassA detect: [ :each | 
		each selector = #parametrizedExample: ].
	self assertParametrizedExample: anExample 
		inClass: GtDummyExamplesWithParametrizedExampleA 
		withProvider: GtDummyExamplesWithParametrizedExampleA.
	self assert: anExample arguments equals: #( ).
	^ anExample
]

{ #category : #'examples - standalone' }
GtExamplesParametrizedExamples >> parametrizedExampleWithTwoArgumentsInClassA [
	<gtExample>
	| anExample |
	anExample := self parametrizedExamplesFromClassA detect: [ :each | 
		each selector = #parametrizedExample:withTwoArguments: ].
	self assertParametrizedExample: anExample 
		inClass: GtDummyExamplesWithParametrizedExampleA 
		withProvider: GtDummyExamplesWithParametrizedExampleA.
	self assert: anExample arguments equals: #( ).
	^ anExample
]

{ #category : #'examples - groups' }
GtExamplesParametrizedExamples >> parametrizedExamplesFromClassA [
	<gtExample>
	| anExamples | 
	anExamples := self parametrizedExampleFactoryForClassA gtParametrizedExamplesContained.
	self assertExamples: anExamples withSelectors: #( parametrizedExample: #parametrizedExample:withTwoArguments: ).
	^ anExamples
	
]

{ #category : #'examples - results' }
GtExamplesParametrizedExamples >> resultOfParametrizedExampleInClassA [
	<gtExample>
	| anExample aResult |
	anExample := self parametrizedExampleInClassA.
	anExample arguments: #( 21 ).
	aResult := anExample result.
	self assert: aResult returnValue equals: 42.
	self assert: aResult hasException not.
	^ aResult
]

{ #category : #'examples - results' }
GtExamplesParametrizedExamples >> resultOfParametrizedExampleWithTwoArgumentsInClassA [
	<gtExample>
	| anExample aResult |
	anExample := self parametrizedExampleWithTwoArgumentsInClassA.
	anExample arguments: #( 40 2 ).
	aResult := anExample result.
	self assert: aResult returnValue equals: 42.
	self assert: aResult hasException not.
	^ aResult
]
