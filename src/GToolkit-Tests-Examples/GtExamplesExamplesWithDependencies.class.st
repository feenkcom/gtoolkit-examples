"
I provide examples for ==GtExample== instances that define various kinds of dependencies.
"
Class {
	#name : #GtExamplesExamplesWithDependencies,
	#superclass : #GtExampleProvider,
	#category : 'GToolkit-Tests-Examples'
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
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #d) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesOnInstanceSide >> #e) gtExample } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - external' }
GtExamplesExamplesWithDependencies >> exampleWithASingleExternalDependency [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #e) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { (GtDummyExamplesOnInstanceSide >> #e) gtExample } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - external' }
GtExamplesExamplesWithDependencies >> exampleWithDirectExternalDependency [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #fWithIndirectExtenalDependency) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesExternalDependencies >> #e) gtExample } 
		andIndirect: {
			(GtDummyExamplesOnInstanceSide >> #e) gtExample}.
		
	^ example
]

{ #category : #'examples - self' }
GtExamplesExamplesWithDependencies >> exampleWithIndirectDependencies [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #b) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesOnInstanceSide >> #c) gtExample.
			(GtDummyExamplesOnInstanceSide >> #d) gtExample } 
		andIndirect: {
			(GtDummyExamplesOnInstanceSide >> #e) gtExample }.
		
	^ example
]

{ #category : #'examples - self' }
GtExamplesExamplesWithDependencies >> exampleWithIndirectDependenciesSharingADependency [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #a) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesOnInstanceSide >> #b) gtExample.
			(GtDummyExamplesOnInstanceSide >> #c) gtExample } 
		andAll: {
			(GtDummyExamplesOnInstanceSide >> #b) gtExample.
			(GtDummyExamplesOnInstanceSide >> #c) gtExample.
			(GtDummyExamplesOnInstanceSide >> #d) gtExample.
			(GtDummyExamplesOnInstanceSide >> #e) gtExample
		}.
		
	^ example
]

{ #category : #'examples - external' }
GtExamplesExamplesWithDependencies >> exampleWithMultipleExternalDependencies [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #b) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesOnInstanceSide >> #c) gtExample .
			(GtDummyExamplesOnInstanceSide >> #d) gtExample } 
		andIndirect: {
			(GtDummyExamplesOnInstanceSide >> #e) gtExample}.
		
	^ example
]

{ #category : #'examples - self' }
GtExamplesExamplesWithDependencies >> exampleWithNoDependencies [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #e) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { } 
		andIndirect: { }.
	
	^ example
]

{ #category : #'examples - self' }
GtExamplesExamplesWithDependencies >> exampleWithSameDependencyCalledTwice [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesOnInstanceSide >> #sameExampleCalledTwice) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { (GtDummyExamplesOnInstanceSide >> #e) gtExample } 
		andIndirect: { }.
	
	^ example
]

{ #category : #'examples - combined' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndExternalDependenciesToDifferentMethods [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #hWithSelfAndExternalDependencies) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesExternalDependencies >> #c) gtExample .
			(GtDummyExamplesOnInstanceSide >> #e) gtExample } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - combined' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndExternalDependenciesToSameMethod [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalDependencies >> #kWithSelfAndExternalForSameMethod) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesExternalDependencies >> #j) gtExample } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - self&super' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndSuperCallsToMethodsWithDifferentSelectors [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #gCallsToDifferentSelfAndSuperMethods) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #aSuperclass) gtExample.
			(GtDummyExamplesInSubclass >> #bInBoth) gtExample } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - self&super' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndSuperCallsToMethodsWithSameSelectors [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #fTwoCallsToDifferentMethodsWithSameSelector) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #bInBoth) gtExample.
			(GtDummyExamplesInSubclass >> #bInBoth) gtExample } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - self&super' }
GtExamplesExamplesWithDependencies >> exampleWithSelfAndSuperCallsToSameMethod [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #eTwoCallsToSameSuperclassMethodWithSameSelector) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #aSuperclass) gtExample.
			"(GtDummyExamplesInSubclass >> #aSuperclass) gtExample" } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - self&super' }
GtExamplesExamplesWithDependencies >> exampleWithSelfCallToSuperMethod [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #hSelfCallToMethodFromSuperclass) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #aSuperclass) gtExample } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - combined' }
GtExamplesExamplesWithDependencies >> exampleWithSelfSuperExternalDependenciesToSameMethod [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesExternalSubclassDependencies >> #iWithSelfSuperExternalDependencies) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: { 
			(GtDummyExamplesExternalDependencies >> #j) gtExample } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - super' }
GtExamplesExamplesWithDependencies >> exampleWithSuperDependencyToDifferentSelector [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #eCallToDifferentSuper) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #dCallSuper) gtExample } 
		andIndirect: { }.
		
	^ example
]

{ #category : #'examples - super' }
GtExamplesExamplesWithDependencies >> exampleWithSuperDependencyToSameSelector [
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInSubclass >> #dCallSuper) gtExample.
	self 
		assertDependenciesFor: example 
		withDirect: {
			(GtDummyExamplesSuperclass >> #dCallSuper) gtExample } 
		andIndirect: { }.
		
	^ example
]
