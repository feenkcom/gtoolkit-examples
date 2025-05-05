"
I provide examples for `GtExample` instances that define various kinds of dependencies.


"
Class {
	#name : #GtExamplesExamplesWithDependencies,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #asserting }
GtExamplesExamplesWithDependencies >> assertDependenciesFor: anExample withDirect: expectedDirectDependencies andAll: expectedAllDependencies [
	| obtainedDirectDependencies obtainedAllDependencies |
	
	obtainedDirectDependencies := anExample directDependencies.
	obtainedAllDependencies := anExample allDependencies.
	
	self assert: anExample isValid.
	self assert: anExample exists.
	self assert: obtainedDirectDependencies asArray equals: expectedDirectDependencies asArray.
	self assert: obtainedAllDependencies size equals: expectedAllDependencies size.
	self assertCollection: obtainedAllDependencies hasSameElements: expectedAllDependencies.
		
]

{ #category : #asserting }
GtExamplesExamplesWithDependencies >> assertDependenciesFor: anExample withDirect: expectedDirectDependencies andIndirect: expectedIndirectDependencies [
	^ self 
		assertDependenciesFor: anExample 
		withDirect: expectedDirectDependencies 
		andAll: expectedDirectDependencies asOrderedCollection, expectedIndirectDependencies
	
	
		
]

{ #category : #'examples - self' }
GtExamplesExamplesWithDependencies >> exampleWithASingleDirectDependency [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesOnInstanceSide >> #d) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesOnInstanceSide >> #e) gtExample}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - external' }
GtExamplesExamplesWithDependencies >> exampleWithASingleExternalDependency [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesExternalDependencies >> #e) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesOnInstanceSide >> #e) gtExample}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - external' }
GtExamplesExamplesWithDependencies >> exampleWithDirectExternalDependency [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesExternalDependencies
			>> #fWithIndirectExtenalDependency) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesExternalDependencies >> #e) gtExample}
		andIndirect: {(GtDummyExamplesOnInstanceSide >> #e) gtExample}.

	^ example
]

{ #category : #'examples - self' }
GtExamplesExamplesWithDependencies >> exampleWithIndirectDependencies [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesOnInstanceSide >> #b) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesOnInstanceSide >> #c) gtExample.
				(GtDummyExamplesOnInstanceSide >> #d) gtExample}
		andIndirect: {(GtDummyExamplesOnInstanceSide >> #e) gtExample}.

	^ example
]

{ #category : #'examples - self' }
GtExamplesExamplesWithDependencies >> exampleWithIndirectDependenciesSharingADependency [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesOnInstanceSide >> #a) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesOnInstanceSide >> #b) gtExample.
				(GtDummyExamplesOnInstanceSide >> #c) gtExample}
		andAll: {(GtDummyExamplesOnInstanceSide >> #b) gtExample.
				(GtDummyExamplesOnInstanceSide >> #c) gtExample.
				(GtDummyExamplesOnInstanceSide >> #d) gtExample.
				(GtDummyExamplesOnInstanceSide >> #e) gtExample}.

	^ example
]

{ #category : #'examples - external' }
GtExamplesExamplesWithDependencies >> exampleWithMultipleExternalDependencies [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesExternalDependencies >> #b) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesOnInstanceSide >> #c) gtExample.
				(GtDummyExamplesOnInstanceSide >> #d) gtExample}
		andIndirect: {(GtDummyExamplesOnInstanceSide >> #e) gtExample}.

	^ example
]

{ #category : #'examples - self' }
GtExamplesExamplesWithDependencies >> exampleWithNoDependencies [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesOnInstanceSide >> #e) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - self' }
GtExamplesExamplesWithDependencies >> exampleWithSameDependencyCalledTwice [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesOnInstanceSide >> #sameExampleCalledTwice) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesOnInstanceSide >> #e) gtExample}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - combined' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndExternalDependenciesToDifferentMethods [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesExternalDependencies
			>> #hWithSelfAndExternalDependencies) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesExternalDependencies >> #c) gtExample.
				(GtDummyExamplesOnInstanceSide >> #e) gtExample}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - combined' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndExternalDependenciesToSameMethod [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesExternalDependencies
			>> #kWithSelfAndExternalForSameMethod) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesExternalDependencies >> #j) gtExample}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - self&super' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndSuperCallsToMethodsWithDifferentSelectors [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesInSubclass >> #gCallsToDifferentSelfAndSuperMethods)
			gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesSuperclass >> #aSuperclass) gtExamplesFactory
					createExampleForMethod: GtDummyExamplesSuperclass >> #aSuperclass
					withProviderClass: GtDummyExamplesInSubclass.
				(GtDummyExamplesInSubclass >> #bInBoth) gtExample}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - self&super' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndSuperCallsToMethodsWithSameSelectors [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesInSubclass
			>> #fTwoCallsToDifferentMethodsWithSameSelector) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesSuperclass >> #bInBoth) gtExamplesFactory
					createExampleForMethod: GtDummyExamplesSuperclass >> #bInBoth
					withProviderClass: GtDummyExamplesInSubclass.
				(GtDummyExamplesInSubclass >> #bInBoth) gtExample}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - self&super' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndSuperCallsToSameMethod [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesInSubclass
			>> #eTwoCallsToSameSuperclassMethodWithSameSelector) gtExample.

	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesSuperclass >> #aSuperclass) gtExamplesFactory
					createExampleForMethod: GtDummyExamplesSuperclass >> #aSuperclass
					withProviderClass: GtDummyExamplesInSubclass}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - self&super' }
GtExamplesExamplesWithDependencies >> exampleWithSelfCallToSuperMethod [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesInSubclass >> #hSelfCallToMethodFromSuperclass)
			gtExample.

	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesSuperclass >> #aSuperclass) gtExamplesFactory
					createExampleForMethod: GtDummyExamplesSuperclass >> #aSuperclass
					withProviderClass: GtDummyExamplesInSubclass}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - combined' }
GtExamplesExamplesWithDependencies >> exampleWithSelfSuperExternalDependenciesInSuperclassToSameMethod [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesExternalSubclassDependencies
			>> #kWithSelfSuperExternalDependenciesToMethodInSubclass) gtExample.

	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesExternalDependencies >> #j) gtExamplesFactory
					createExampleForMethod: GtDummyExamplesExternalDependencies >> #j
					withProviderClass: GtDummyExamplesExternalSubclassDependencies}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - combined' }
GtExamplesExamplesWithDependencies >> exampleWithSelfSuperExternalDependenciesToSameMethod [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesExternalSubclassDependencies
			>> #iWithSelfSuperExternalDependencies) gtExample.

	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesExternalDependencies >> #j) gtExamplesFactory
					createExampleForMethod: GtDummyExamplesExternalDependencies >> #j
					withProviderClass: GtDummyExamplesExternalSubclassDependencies.
				(GtDummyExamplesExternalDependencies >> #j) gtExample}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - super' }
GtExamplesExamplesWithDependencies >> exampleWithSuperDependencyToDifferentSelector [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesInSubclass >> #eCallToDifferentSuper) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesSuperclass >> #dCallSuper) gtExamplesFactory
					createExampleForMethod: GtDummyExamplesSuperclass >> #dCallSuper
					withProviderClass: GtDummyExamplesInSubclass}
		andIndirect: {}.

	^ example
]

{ #category : #'examples - super' }
GtExamplesExamplesWithDependencies >> exampleWithSuperDependencyToSameSelector [
	<gtExample>
	<return: #GtExample>
	| example |
	example := (GtDummyExamplesInSubclass >> #dCallSuper) gtExample.
	self
		assertDependenciesFor: example
		withDirect: {(GtDummyExamplesSuperclass >> #dCallSuper) gtExamplesFactory
					createExampleForMethod: GtDummyExamplesSuperclass >> #dCallSuper
					withProviderClass: GtDummyExamplesInSubclass}
		andIndirect: {}.

	^ example
]
