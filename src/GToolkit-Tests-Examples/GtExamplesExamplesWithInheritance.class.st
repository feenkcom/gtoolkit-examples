"
I provide examples for {{gtClass:GtExample}} instances that use inherited or overriden examples.


"
Class {
	#name : #GtExamplesExamplesWithInheritance,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromRootClass [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForRootClass gtExamplesAllContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleC).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassA [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassA gtExamplesAllContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleB exampleC exampleD).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassB [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassB gtExamplesAllContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleB exampleC exampleF exampleG).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassC [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassC gtExamplesAllContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleA exampleB exampleB exampleC exampleD).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassD [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassD gtExamplesAllContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleA exampleB exampleB exampleC exampleD).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassE [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassE gtExamplesAllContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleB exampleC exampleH).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassF [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassF gtExamplesAllContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleB exampleC exampleH).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassG [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassG gtExamplesAllContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleC).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassOfSubclassA [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassOfSubclassA gtExamplesAllContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleB exampleC exampleD exampleE).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> allExamplesFromSubclassOfSubclassB [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassOfSubclassB gtExamplesAllContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleB exampleC exampleF exampleG exampleH).
	^ allExamples
]

{ #category : #assertions }
GtExamplesExamplesWithInheritance >> assertConcreteExample: example inClass: aMethodClass [.
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
]

{ #category : #assertions }
GtExamplesExamplesWithInheritance >> assertExamples: currentExamples withSelectors: expectedSelectors [
	| obtainedSelectors |
	obtainedSelectors := (currentExamples collect: #selector) asArray sorted: [ :a :b | a < b ].
	self assert: obtainedSelectors size equals: expectedSelectors size.
	self assert: obtainedSelectors equals: expectedSelectors.
]

{ #category : #assertions }
GtExamplesExamplesWithInheritance >> assertInheritedExample: example inClass: aMethodClass withProvider: aProviderClass [.
	self assert: example isInherited.
	self assert: example providerClass equals: aProviderClass.
	self assert: example methodClass equals: aMethodClass.
	self assert: example provider class equals: aProviderClass.
	self assert: example hasValidProviderClass.
	self assert: example isValid.
	self assert: example exists.
]

{ #category : #assertions }
GtExamplesExamplesWithInheritance >> assertInvalidProviderClassExample: example [
	self assert: example isValid not.
	self assert: example hasValidProviderClass not.
	self assert: example isInherited.
	self assert: example problems size equals: 1.
	self assert: example problems asArray first class equals: GtExampleInvalidProviderClass.
	
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> exampleCInRootClass [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromRootClass
			detect: [ :each | each selector = #exampleC ].
	self assertConcreteExample: example inClass: GtDummyExamplesWithInheritanceRoot.
	self
		assert: example gtDisplayString
		equals: 'GtDummyExamplesWithInheritanceRoot >> #exampleC'.
	^ example
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForRootClass [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceRoot gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceRoot.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassA [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassA gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceSubclassA.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassB [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassB gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceSubclassB.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassC [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceClassSideSubclassC
			gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceClassSideSubclassC.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassD [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceClassSideSubclassD
			gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceClassSideSubclassD.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassE [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassE gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceSubclassE.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassF [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassF gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceSubclassF.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassG [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassG gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceSubclassG.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassOfSubclassA [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassOfSubclassA
			gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceSubclassOfSubclassA.
	^ exampleFactory
]

{ #category : #'examples - factories' }
GtExamplesExamplesWithInheritance >> exampleFactoryForSubclassOfSubclassB [
	<gtExample>
	<return: #GtExampleFactory>
	| exampleFactory |
	exampleFactory := GtDummyExamplesWithInheritanceSubclassOfSubclassB
			gtExamplesFactory.
	self
		assertExampleFactory: exampleFactory
		forClass: GtDummyExamplesWithInheritanceSubclassOfSubclassB.
	^ exampleFactory
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromRootClass [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForRootClass gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleB exampleC).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassA [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassA gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA exampleD).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassB [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassB gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleF exampleG).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassC [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassC gtExamplesContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleB exampleB exampleD).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassD [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassD gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleA).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassF [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassF gtExamplesContained.
	self assertExamples: allExamples withSelectors: #().
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassOfSubclassA [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassOfSubclassA gtExamplesContained.
	self
		assertExamples: allExamples
		withSelectors: #(exampleA exampleB exampleD exampleE).
	^ allExamples
]

{ #category : #'examples - groups' }
GtExamplesExamplesWithInheritance >> examplesFromSubclassOfSubclassB [
	<gtExample>
	<return: #OrderedCollection>
	| allExamples |
	allExamples := self exampleFactoryForSubclassOfSubclassB gtExamplesContained.
	self assertExamples: allExamples withSelectors: #(exampleH).
	^ allExamples
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleAInSubclassB [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassB
			detect: [ :each | each selector = #exampleA ].
	self
		assertInheritedExample: example
		inClass: GtDummyExamplesWithInheritanceRoot
		withProvider: GtDummyExamplesWithInheritanceSubclassB.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleAInSubclassG [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassG
			detect: [ :each | each selector = #exampleA ].
	self
		assertInheritedExample: example
		inClass: GtDummyExamplesWithInheritanceRoot
		withProvider: GtDummyExamplesWithInheritanceSubclassG.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleAInSubclassOfSubclassB [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassOfSubclassB
			detect: [ :each | each selector = #exampleA ].
	self
		assertInheritedExample: example
		inClass: GtDummyExamplesWithInheritanceRoot
		withProvider: GtDummyExamplesWithInheritanceSubclassOfSubclassB.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleBClassSideInSubclassD [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassD
			detect: [ :each | each selector = #exampleB and: [ each methodClass isMeta ] ].
	self
		assertInheritedExample: example
		inClass: GtDummyExamplesWithInheritanceClassSideSubclassC class
		withProvider: GtDummyExamplesWithInheritanceClassSideSubclassD class.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleBInSubclassEOverridenByNonExampleMethod [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassE
			detect: [ :each | each selector = #exampleB ].
	self
		assertInheritedExample: example
		inClass: GtDummyExamplesWithInheritanceRoot
		withProvider: GtDummyExamplesWithInheritanceSubclassE.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleBInstanceSideInSubclassD [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassD
			detect: [ :each | each selector = #exampleB and: [ each methodClass isMeta not ] ].
	self
		assertInheritedExample: example
		inClass: GtDummyExamplesWithInheritanceClassSideSubclassC
		withProvider: GtDummyExamplesWithInheritanceClassSideSubclassD.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleCInSubclassB [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassB
			detect: [ :each | each selector = #exampleC ].
	self
		assertInheritedExample: example
		inClass: GtDummyExamplesWithInheritanceRoot
		withProvider: GtDummyExamplesWithInheritanceSubclassB.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleCInSubclassOfSubclassA [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassOfSubclassA
			detect: [ :each | each selector = #exampleC ].
	self
		assertInheritedExample: example
		inClass: GtDummyExamplesWithInheritanceRoot
		withProvider: GtDummyExamplesWithInheritanceSubclassOfSubclassA.
	^ example
]

{ #category : #'examples - equality' }
GtExamplesExamplesWithInheritance >> inheritedExampleClassSideEqualityWithSelf [
	<gtExample>
	<return: #GtExample>
	| example anotherExample |
	example := self inheritedExampleBClassSideInSubclassD.
	anotherExample := self inheritedExampleBClassSideInSubclassD.
	self assert: example = example.
	self assert: example = anotherExample.
	self assert: example hash = anotherExample hash.
	^ example
]

{ #category : #'examples - subjects' }
GtExamplesExamplesWithInheritance >> inheritedExampleClassSideHasClassAsSubject [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self inheritedExampleBClassSideInSubclassD.
	self assert: example subjects size equals: 1.
	self assert: example subjects first class equals: GtExampleClassSubject.
	self
		assert: example subjects first theClass
		equals: GtDummyExamplesWithInheritanceClassSideSubclassD.
	^ example
]

{ #category : #'examples - equality' }
GtExamplesExamplesWithInheritance >> inheritedExampleClassSideNoEqualityWithInstanceSide [
	<gtExample>
	<return: #GtExample>
	| example anotherExample |
	example := self inheritedExampleBClassSideInSubclassD.
	anotherExample := self inheritedExampleBInstanceSideInSubclassD.
	self assert: (example = anotherExample) not.
	self assert: (example hash = anotherExample hash) not.
	^ example
]

{ #category : #'examples - printing' }
GtExamplesExamplesWithInheritance >> inheritedExampleClassSidePrinting [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self
			inheritedExampleHInSubclassFOnClassSideOverridenByNonExampleMethod.
	self
		assert: example gtDisplayString
		equals: 'GtDummyExamplesWithInheritanceSubclassF class(GtDummyExamplesWithInheritanceSubclassE class) >> #exampleH'.
	self
		assert: example classLabel
		equals: 'GtDummyExamplesWithInheritanceSubclassF class(GtDummyExamplesWithInheritanceSubclassE class)'.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> inheritedExampleHInSubclassFOnClassSideOverridenByNonExampleMethod [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassF
			detect: [ :each | each selector = #exampleH ].
	self
		assertInheritedExample: example
		inClass: GtDummyExamplesWithInheritanceSubclassE class
		withProvider: GtDummyExamplesWithInheritanceSubclassF class.
	^ example
]

{ #category : #'examples - equality' }
GtExamplesExamplesWithInheritance >> inheritedExampleInstanceSideEqualityWithSelf [
	<gtExample>
	<return: #GtExample>
	| example anotherExample |
	example := self inheritedExampleAInSubclassB.
	anotherExample := self inheritedExampleAInSubclassB.
	self assert: example = example.
	self assert: example = anotherExample.
	self assert: example hash = anotherExample hash.
	^ example
]

{ #category : #'examples - subjects' }
GtExamplesExamplesWithInheritance >> inheritedExampleInstanceSideHasNoDefaultSubject [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self inheritedExampleAInSubclassB.
	self assert: example subjects size equals: 0.
	^ example
]

{ #category : #'examples - subjects' }
GtExamplesExamplesWithInheritance >> inheritedExampleInstanceSideHasOverridenSubjects [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self inheritedExampleAInSubclassG.
	self assert: example subjects size equals: 3.
	{Object.
		GtExample.
		String}
		do: [ :each | 
			self
				assert: (example hasSubject: (self class gtExamplesFactoryClass subjectFrom: each)) ].
	^ example
]

{ #category : #'examples - printing' }
GtExamplesExamplesWithInheritance >> inheritedExampleInstanceSidePrinting [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self inheritedExampleAInSubclassB.
	self
		assert: example gtDisplayString
		equals: 'GtDummyExamplesWithInheritanceSubclassB(GtDummyExamplesWithInheritanceRoot) >> #exampleA'.
	self
		assert: example classLabel
		equals: 'GtDummyExamplesWithInheritanceSubclassB(GtDummyExamplesWithInheritanceRoot)'.
	^ example
]

{ #category : #'examples - equality' }
GtExamplesExamplesWithInheritance >> inheritedExampleNoEqualityWithSameInheritedExampleOfSubclass [
	<gtExample>
	<description: 'The same example method inherited in two subclasses should not produce equal examples.'>
	<return: #GtExample>
	| example anotherExample |
	example := self inheritedExampleAInSubclassB.
	anotherExample := self inheritedExampleAInSubclassOfSubclassB.
	self assert: (example = anotherExample) not.
	self assert: (example hash = anotherExample hash) not.
	^ example
]

{ #category : #'examples - invalid' }
GtExamplesExamplesWithInheritance >> invalidExampleWithInvalidSuperclassProvider [
	<gtExample>
	<return: #GtExample>
	| factory example |
	factory := self exampleFactoryForSubclassB.
	factory
		exampleFromMethod: GtDummyExamplesWithInheritanceSubclassOfSubclassB
				>> #exampleH
		withProviderClass: GtDummyExamplesWithInheritanceSubclassB
		do: [ :anExample | example := anExample ].
	self assert: example notNil.
	self assertInvalidProviderClassExample: example.
	^ example
]

{ #category : #'examples - invalid' }
GtExamplesExamplesWithInheritance >> invalidExampleWithInvalidUnrelatedClassProvider [
	<gtExample>
	<return: #GtExample>
	| factory example |
	factory := self exampleFactoryForSubclassB.
	factory
		exampleFromMethod: GtDummyExamplesWithInheritanceSubclassOfSubclassB
				>> #exampleH
		withProviderClass: GtDummyExamplesWithInheritanceSubclassF
		do: [ :anExample | example := anExample ].
	self assert: example notNil.
	self assertInvalidProviderClassExample: example.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> overridenExampleAInSubclassA [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassA
			detect: [ :each | each selector = #exampleA ].
	self
		assertConcreteExample: example
		inClass: GtDummyExamplesWithInheritanceSubclassA.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> overridenExampleBClassSideInSubclassC [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self examplesFromSubclassC
			detect: [ :each | each selector = #exampleB and: [ each methodClass isMeta ] ].
	self
		assertConcreteExample: example
		inClass: GtDummyExamplesWithInheritanceClassSideSubclassC class.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> overridenExampleBInSubclassOfSubclassA [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self allExamplesFromSubclassOfSubclassA
			detect: [ :each | each selector = #exampleB ].
	self
		assertConcreteExample: example
		inClass: GtDummyExamplesWithInheritanceSubclassOfSubclassA.
	^ example
]

{ #category : #'examples - standalone' }
GtExamplesExamplesWithInheritance >> overridenExampleBInstanceSideInSubclassC [
	<gtExample>
	<return: #GtExample>
	| example |
	example := self examplesFromSubclassC
			detect: [ :each | each selector = #exampleB and: [ each methodClass isMeta not ] ].
	self
		assertConcreteExample: example
		inClass: GtDummyExamplesWithInheritanceClassSideSubclassC.
	^ example
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfExampleCInRootClass [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self exampleCInRootClass result.
	self
		assert: result returnValue
		equals: 'c-' , GtDummyExamplesWithInheritanceRoot name.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleAInSubclassB [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self inheritedExampleAInSubclassB result.
	self assert: result returnValue equals: 'a'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleBClassSideInSubclassD [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self inheritedExampleBClassSideInSubclassD result.
	self assert: result returnValue equals: 'bb_class'.
	self assert: result hasException not.
	self assert: result hasProblems not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleBInSubclassEOverridenByNonExampleMethod [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self inheritedExampleBInSubclassEOverridenByNonExampleMethod result.
	self assert: result returnValue equals: 'bb_no_example'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleBInstanceSideInSubclassD [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self overridenExampleBInstanceSideInSubclassC result.
	self assert: result returnValue equals: 'bb'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleCInSubclassB [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self inheritedExampleCInSubclassB result.
	self
		assert: result returnValue
		equals: 'c-' , GtDummyExamplesWithInheritanceSubclassB name.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleCInSubclassOfSubclassA [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self inheritedExampleCInSubclassOfSubclassA result.
	self
		assert: result returnValue
		equals: 'c-' , GtDummyExamplesWithInheritanceSubclassOfSubclassA name.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfInheritedExampleHInSubclassFOnClassSideOverridenByNonExampleMethod [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self
			inheritedExampleHInSubclassFOnClassSideOverridenByNonExampleMethod result.
	self assert: result returnValue equals: 'hhh_no_example'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - invalid' }
GtExamplesExamplesWithInheritance >> resultOfInvalidExampleWithInvalidSuperclassProvider [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self invalidExampleWithInvalidSuperclassProvider result.
	self assert: result returnValue isNotNil.
	self assert: result hasException.
	self assert: result hasProblems.
	self assert: result isError.
	self assert: result isFailure not.
	self assert: result isSuccess not.
	self assert: result returnValue class equals: MessageNotUnderstood.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfOverridenExampleAInSubclassA [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self overridenExampleAInSubclassA result.
	self assert: result returnValue equals: 'aa'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfOverridenExampleBClassSideInSubclassC [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self overridenExampleBClassSideInSubclassC result.
	self assert: result returnValue equals: 'bb_class'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfOverridenExampleBInSubclassOfSubclassA [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self overridenExampleBInSubclassOfSubclassA result.
	self assert: result returnValue equals: 'bbb'.
	self assert: result hasException not.
	^ result
]

{ #category : #'examples - results' }
GtExamplesExamplesWithInheritance >> resultOfOverridenExampleBInstanceSideInSubclassC [
	<gtExample>
	<return: #GtExampleResult>
	| result |
	result := self overridenExampleBInstanceSideInSubclassC result.
	self assert: result returnValue equals: 'bb'.
	self assert: result hasException not.
	^ result
]
