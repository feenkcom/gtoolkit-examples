Class {
	#name : #GtExamplesParametrizedExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples'
}

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
	self assert: example class equals: GtParametrizedExample.
	self assert: example providerClass equals: aProviderClass.
	self assert: example methodClass equals: aMethodClass.
	self assert: example provider class equals: aProviderClass.
	self assert: example hasValidProviderClass.
	self assert: example isValid.
	self assert: example exists.
]

{ #category : #assertions }
GtExamplesParametrizedExamples >> assertParametrizedExampleFactory: anExampleFactory forClass: aSourceClass [
	self assert: anExampleFactory sourceClass equals: aSourceClass.
	self assert: anExampleFactory exampleClass equals: GtParametrizedExample.
]

{ #category : #'examples - factories' }
GtExamplesParametrizedExamples >> exampleFactoryForClassB [
	<gtExample>
	<return: #GtExampleFactory>
	| anExampleFactory |
	anExampleFactory := GtDummyExamplesWithParametrizedExampleB gtExamplesFactory.
	self
		assertExampleFactory: anExampleFactory
		forClass: GtDummyExamplesWithParametrizedExampleB.
	^ anExampleFactory
]

{ #category : #'examples - groups' }
GtExamplesParametrizedExamples >> examplesFromClassB [
	<gtExample>
	<return: #OrderedCollection>
	| anExamples |
	anExamples := self exampleFactoryForClassB gtExamplesContained.
	self assertExamples: anExamples withSelectors: #(#normalExample).
	^ anExamples
]

{ #category : #'examples - standalone' }
GtExamplesParametrizedExamples >> normalExampleWithParametrizedExampleDependencyInClassB [
	<gtExample>
	<return: #GtExample>
	| anExample theDependencies |
	anExample := self examplesFromClassB
			detect: [ :each | each selector = #normalExample ].	"self assertParametrizedExample: anExample 
		inClass: GtDummyExamplesWithParametrizedExampleB 
		withProvider: GtDummyExamplesWithParametrizedExampleB."
	theDependencies := anExample directDependencies.
	self assert: theDependencies size equals: 1.
	self
		assert: theDependencies first method
		equals: GtDummyExamplesWithParametrizedExampleB >> #ignoringParameterExample:.
	^ anExample
]

{ #category : #'examples - factories' }
GtExamplesParametrizedExamples >> parametrizedExampleFactoryForClassA [
	<gtExample>
	<return: #GtParametrizedExampleFactory>
	| anExampleFactory |
	anExampleFactory := GtDummyExamplesWithParametrizedExampleA
			gtParametrizedExamplesFactory.
	self
		assertParametrizedExampleFactory: anExampleFactory
		forClass: GtDummyExamplesWithParametrizedExampleA.
	^ anExampleFactory
]

{ #category : #'examples - factories' }
GtExamplesParametrizedExamples >> parametrizedExampleFactoryForClassB [
	<gtExample>
	<return: #GtParametrizedExampleFactory>
	| anExampleFactory |
	anExampleFactory := GtDummyExamplesWithParametrizedExampleB
			gtParametrizedExamplesFactory.
	self
		assertParametrizedExampleFactory: anExampleFactory
		forClass: GtDummyExamplesWithParametrizedExampleB.
	^ anExampleFactory
]

{ #category : #'examples - standalone' }
GtExamplesParametrizedExamples >> parametrizedExampleInClassA [
	<gtExample>
	<return: #GtParametrizedExample>
	| anExample |
	anExample := self parametrizedExamplesFromClassA
			detect: [ :each | each selector = #parametrizedExample: ].
	self
		assertParametrizedExample: anExample
		inClass: GtDummyExamplesWithParametrizedExampleA
		withProvider: GtDummyExamplesWithParametrizedExampleA.
	self assert: anExample arguments equals: #().
	^ anExample
]

{ #category : #'examples - standalone' }
GtExamplesParametrizedExamples >> parametrizedExampleInClassB [
	<gtExample>
	<return: #GtParametrizedExample>
	| anExample theDependencies |
	anExample := self parametrizedExamplesFromClassB
			detect: [ :each | each selector = #parametrizedExampleWithNormalExampleDependency: ].
	self
		assertParametrizedExample: anExample
		inClass: GtDummyExamplesWithParametrizedExampleB
		withProvider: GtDummyExamplesWithParametrizedExampleB.
	self assert: anExample arguments equals: #().
	theDependencies := anExample directDependencies.
	self assert: theDependencies size equals: 1.
	self
		assert: theDependencies first method
		equals: GtDummyExamplesWithParametrizedExampleB >> #normalExample.
	^ anExample
]

{ #category : #'examples - standalone' }
GtExamplesParametrizedExamples >> parametrizedExampleWithTwoArgumentsInClassA [
	<gtExample>
	<return: #GtParametrizedExample>
	| anExample |
	anExample := self parametrizedExamplesFromClassA
			detect: [ :each | each selector = #parametrizedExample:withTwoArguments: ].
	self
		assertParametrizedExample: anExample
		inClass: GtDummyExamplesWithParametrizedExampleA
		withProvider: GtDummyExamplesWithParametrizedExampleA.
	self assert: anExample arguments equals: #().
	^ anExample
]

{ #category : #'examples - standalone' }
GtExamplesParametrizedExamples >> parametrizedExampleWithTwoArgumentsInClassB [
	<gtExample>
	<return: #GtParametrizedExample>
	| anExample theDependencies |
	anExample := self parametrizedExamplesFromClassB
			detect: [ :each | 
				each selector
					= #parametrizedExample:withTwoArgumentsAndParametrizedExampleDependency: ].
	self
		assertParametrizedExample: anExample
		inClass: GtDummyExamplesWithParametrizedExampleB
		withProvider: GtDummyExamplesWithParametrizedExampleB.
	self assert: anExample arguments equals: #().
	theDependencies := anExample directDependencies.
	self assert: theDependencies size equals: 1.
	self
		assert: theDependencies first method
		equals: GtDummyExamplesWithParametrizedExampleB
				>> #parametrizedExampleWithNormalExampleDependency:.
	^ anExample
]

{ #category : #'examples - groups' }
GtExamplesParametrizedExamples >> parametrizedExamplesFromClassA [
	<gtExample>
	<return: #OrderedCollection>
	| anExamples |
	anExamples := self parametrizedExampleFactoryForClassA
			gtParametrizedExamplesContained.
	self
		assertExamples: anExamples
		withSelectors: #(parametrizedExample: #parametrizedExample:withTwoArguments:).
	^ anExamples
]

{ #category : #'examples - groups' }
GtExamplesParametrizedExamples >> parametrizedExamplesFromClassB [
	<gtExample>
	<return: #OrderedCollection>
	| anExamples |
	anExamples := self parametrizedExampleFactoryForClassB
			gtParametrizedExamplesContained.
	self
		assertExamples: anExamples
		withSelectors: #(ignoringParameterExample: #parametrizedExample:withTwoArgumentsAndParametrizedExampleDependency: parametrizedExampleWithNormalExampleDependency:).
	^ anExamples
]

{ #category : #'examples - results' }
GtExamplesParametrizedExamples >> resultOfParametrizedExampleInClassA [
	<gtExample>
	<return: #GtExampleResult>
	| anExample aResult |
	anExample := self parametrizedExampleInClassA.
	anExample arguments: #(21).
	aResult := anExample result.
	self assert: aResult returnValue equals: 42.
	self assert: aResult hasException not.
	^ aResult
]

{ #category : #'examples - results' }
GtExamplesParametrizedExamples >> resultOfParametrizedExampleWithTwoArgumentsInClassA [
	<gtExample>
	<return: #GtExampleResult>
	| anExample aResult |
	anExample := self parametrizedExampleWithTwoArgumentsInClassA.
	anExample arguments: #(40 2).
	aResult := anExample result.
	self assert: aResult returnValue equals: 42.
	self assert: aResult hasException not.
	^ aResult
]
