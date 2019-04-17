Class {
	#name : #GtExamplesExamplesWithInheritance,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromRootClass [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForRootClass gtAllExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleC).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassA [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassA gtAllExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleC exampleD).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassB [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassB gtAllExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleC exampleF exampleG).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassC [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassC gtAllExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleA exampleB exampleB exampleC exampleD).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassD [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassD gtAllExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleA exampleB exampleB exampleC exampleD).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassOfSubclassA [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassOfSubclassA gtAllExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleC exampleD exampleE).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassOfSubclassB [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassOfSubclassB gtAllExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleC exampleF exampleG exampleH).
	^ allExamples
	
]

{ #category : #assertions }
GtExamplesExamplesWithInheritance >> assertConcreteExample: example inClass: aMethodClass. [
	self assert: example isInherited not.
	self assert: example providerClass equals: aMethodClass.
	self assert: example methodClass equals: aMethodClass.
	self assert: example provider class equals: aMethodClass.
	self assert: example hasValidProviderClass.
	self assert: example isValid.
	self assert: example exists.
]

{ #category : #assertions }
GtExamplesExamplesWithInheritance >> assertExampleFactory: exampleFactory forClass: aSourceClass [
	self assert: exampleFactory sourceClass equals: aSourceClass.
	self assert: exampleFactory exampleClass equals: GtExample.
	self assert: exampleFactory provider equals: nil.
]

{ #category : #assertions }
GtExamplesExamplesWithInheritance >> assertExamples: currentExamples withSelectors: expectedSelectors [
	| obtainedSelectors |
	obtainedSelectors := (currentExamples collect: #selector) asArray sorted: [ :a :b | a < b ].
	self assert: obtainedSelectors size equals: expectedSelectors size.
	self assert: obtainedSelectors equals: expectedSelectors.
]

{ #category : #assertions }
GtExamplesExamplesWithInheritance >> assertOverridenExample: example inClass: aMethodClass withProvider: aProviderClass. [
	self assert: example isInherited.
	self assert: example providerClass equals: aProviderClass.
	self assert: example methodClass equals: aMethodClass.
	self assert: example provider class equals: aProviderClass.
	self assert: example hasValidProviderClass.
	self assert: example isValid.
	self assert: example exists.
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> exampleCInRootClass [
	<gtExample>
	| example |
	example := self allExamplesFromRootClass detect: [ :each | each selector = #exampleC ].
	self assertConcreteExample: example inClass: GtDummyExamplesWithInheritanceRoot.
	self assert: example gtDisplayString equals: 'GtDummyExamplesWithInheritanceRoot >> #exampleC'.
	^ example
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForRootClass [
	<gtExample>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceRoot gtExamplesFactory.
	self assertExampleFactory: exampleFactory forClass: GtDummyExamplesWithInheritanceRoot.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassA [
	<gtExample>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassA gtExamplesFactory.
	self assertExampleFactory: exampleFactory forClass: GtDummyExamplesWithInheritanceSubclassA.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassB [
	<gtExample>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassB gtExamplesFactory.
	self assertExampleFactory: exampleFactory forClass: GtDummyExamplesWithInheritanceSubclassB.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassC [
	<gtExample>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceClassSideSubclassC gtExamplesFactory.
	self assertExampleFactory: exampleFactory forClass: GtDummyExamplesWithInheritanceClassSideSubclassC.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassD [
	<gtExample>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceClassSideSubclassD gtExamplesFactory.
	self assertExampleFactory: exampleFactory forClass: GtDummyExamplesWithInheritanceClassSideSubclassD.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassOfSubclassA [
	<gtExample>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassOfSubclassA gtExamplesFactory.
	self assertExampleFactory: exampleFactory forClass: GtDummyExamplesWithInheritanceSubclassOfSubclassA.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassOfSubclassB [
	<gtExample>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassOfSubclassB gtExamplesFactory.
	self assertExampleFactory: exampleFactory forClass: GtDummyExamplesWithInheritanceSubclassOfSubclassB.
	^ exampleFactory
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromRootClass [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForRootClass gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleC). 
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassA [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassA gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleD).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassB [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassB gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleF exampleG).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassC [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassC gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleB exampleD).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassD [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassD gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassOfSubclassA [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassOfSubclassA gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleD exampleE).
	^ allExamples
	
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassOfSubclassB [
	<gtExample>
	| allExamples |
	allExamples := self exampleFactoryForSubclassOfSubclassB gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleH).
	^ allExamples
	
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleAInSubclassB [
	<gtExample>
	| example |
	example := self allExamplesFromSubclassB detect: [ :each | each selector = #exampleA ].
	self assertOverridenExample: example 
		inClass: GtDummyExamplesWithInheritanceRoot 
		withProvider: GtDummyExamplesWithInheritanceSubclassB.
	self assert: example gtDisplayString equals: 'GtDummyExamplesWithInheritanceSubclassB(GtDummyExamplesWithInheritanceRoot) >> #exampleA'.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleBClassSideInSubclassD [
	<gtExample>
	| example |
	example := self allExamplesFromSubclassD detect: [ :each | 
		(each selector = #exampleB) and: [ each methodClass isMeta ] ].
	self 
		assertOverridenExample: example 
		inClass: GtDummyExamplesWithInheritanceClassSideSubclassC class
		withProvider: GtDummyExamplesWithInheritanceClassSideSubclassD class.
	self 
		assert: example gtDisplayString 
		equals: 'GtDummyExamplesWithInheritanceClassSideSubclassD class(GtDummyExamplesWithInheritanceClassSideSubclassC class) >> #exampleB'.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleBInstanceSideInSubclassD [
	<gtExample>
	| example |
	example := self allExamplesFromSubclassD detect: [ :each | 
		(each selector = #exampleB) and: [ each methodClass isMeta not ] ].
	self 
		assertOverridenExample: example 
		inClass: GtDummyExamplesWithInheritanceClassSideSubclassC
		withProvider: GtDummyExamplesWithInheritanceClassSideSubclassD.
	self 
		assert: example gtDisplayString 
		equals: 'GtDummyExamplesWithInheritanceClassSideSubclassD(GtDummyExamplesWithInheritanceClassSideSubclassC) >> #exampleB'.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleCInSubclassB [
	<gtExample>
	| example |
	example := self allExamplesFromSubclassB detect: [ :each | each selector = #exampleC ].
	self assertOverridenExample: example 
		inClass: GtDummyExamplesWithInheritanceRoot 
		withProvider: GtDummyExamplesWithInheritanceSubclassB.
	self assert: example gtDisplayString equals: 'GtDummyExamplesWithInheritanceSubclassB(GtDummyExamplesWithInheritanceRoot) >> #exampleC'.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleCInSubclassOfSubclassA [
	<gtExample>
	| example |
	example := self allExamplesFromSubclassOfSubclassA detect: [ :each | each selector = #exampleC ].
	self assertOverridenExample: example 
		inClass: GtDummyExamplesWithInheritanceRoot 
		withProvider: GtDummyExamplesWithInheritanceSubclassOfSubclassA.
	self assert: example gtDisplayString equals: 'GtDummyExamplesWithInheritanceSubclassOfSubclassA(GtDummyExamplesWithInheritanceRoot) >> #exampleC'.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> overridenExampleAInSubclassA [
	<gtExample>
	| example |
	example := self allExamplesFromSubclassA detect: [ :each | each selector = #exampleA ].
	self assertConcreteExample: example inClass: GtDummyExamplesWithInheritanceSubclassA.
	self assert: example gtDisplayString equals: 'GtDummyExamplesWithInheritanceSubclassA >> #exampleA'.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> overridenExampleBClassSideInSubclassC [
	<gtExample>
	| example |
	example := self examplesFromSubclassC detect: [ :each | 
		(each selector = #exampleB) and: [ each methodClass isMeta ] ].
	self 
		assertConcreteExample: example 
		inClass: GtDummyExamplesWithInheritanceClassSideSubclassC class.
	self assert: example gtDisplayString equals: 'GtDummyExamplesWithInheritanceClassSideSubclassC class >> #exampleB'.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> overridenExampleBInSubclassOfSubclassA [
	<gtExample>
	| example |
	example := self allExamplesFromSubclassOfSubclassA detect: [ :each | each selector = #exampleB ].
	self assertConcreteExample: example inClass: GtDummyExamplesWithInheritanceSubclassOfSubclassA.
	self assert: example gtDisplayString equals: 'GtDummyExamplesWithInheritanceSubclassOfSubclassA >> #exampleB'.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> overridenExampleBInstanceSideInSubclassC [
	<gtExample>
	| example |
	example := self examplesFromSubclassC detect: [ :each | 
		(each selector = #exampleB) and: [ each methodClass isMeta not ] ].
	self 
		assertConcreteExample: example 
		inClass: GtDummyExamplesWithInheritanceClassSideSubclassC.
	self assert: example gtDisplayString equals: 'GtDummyExamplesWithInheritanceClassSideSubclassC >> #exampleB'.
	^ example
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfExampleCInRootClass [
	<gtExample>
	| result |
	result := self exampleCInRootClass result.
	self assert: result returnValue equals: 'c-', GtDummyExamplesWithInheritanceRoot name.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleAInSubclassB [
	<gtExample>
	| result |
	result := self inheritedExampleAInSubclassB result.
	self assert: result returnValue equals: 'a'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleBClassSideInSubclassD [
	<gtExample>
	| result |
	result := self inheritedExampleBClassSideInSubclassD result.
	self assert: result returnValue equals: 'bb_class'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleBInstanceSideInSubclassD [
	<gtExample>
	| result |
	result := self overridenExampleBInstanceSideInSubclassC result.
	self assert: result returnValue equals: 'bb'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleCInSubclassB [
	<gtExample>
	| result |
	result := self inheritedExampleCInSubclassB result.
	self assert: result returnValue equals: 'c-', GtDummyExamplesWithInheritanceSubclassB name.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleCInSubclassOfSubclassA [
	<gtExample>
	| result |
	result := self inheritedExampleCInSubclassOfSubclassA result.
	self assert: result returnValue equals: 'c-', GtDummyExamplesWithInheritanceSubclassOfSubclassA name.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfOverridenExampleAInSubclassA [
	<gtExample>
	| result |
	result := self overridenExampleAInSubclassA result.
	self assert: result returnValue equals: 'aa'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfOverridenExampleBClassSideInSubclassC [
	<gtExample>
	| result |
	result := self overridenExampleBClassSideInSubclassC result.
	self assert: result returnValue equals: 'bb_class'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfOverridenExampleBInSubclassOfSubclassA [
	<gtExample>
	| result |
	result := self overridenExampleBInSubclassOfSubclassA result.
	self assert: result returnValue equals: 'bbb'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfOverridenExampleBInstanceSideInSubclassC [
	<gtExample>
	| result |
	result := self overridenExampleBInstanceSideInSubclassC result.
	self assert: result returnValue equals: 'bb'.
	self assert: result hasException not.
	^ result
]
