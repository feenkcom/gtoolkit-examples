Class {
	#name : #GtDummyExamplesExternalDependencies,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesExternalDependencies >> a [
	<gtExample>
	
	^ GtDummyExamplesOnInstanceSide new b + GtDummyExamplesOnInstanceSide new c
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> b [
	<gtExample>
	
	^ 38 + GtDummyExamplesOnInstanceSide new c + GtDummyExamplesOnInstanceSide new d 
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> c [
	<gtExample>
	
	^ 41 
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> e [
	<gtExample>
	
	^ GtDummyExamplesOnInstanceSide new e
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> fWithIndirectExtenalDependency [
	<gtExample>
	
	^ self e
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> gWithDirectAndIndirectDependencies [
	<gtExample>
	
	^ self e
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> hWithSelfAndExternalDependencies [
	<gtExample>
	
	^ self c + GtDummyExamplesOnInstanceSide new e
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> j [
	<gtExample>
	^ 1
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> kWithSelfAndExternalForSameMethod [
	<gtExample>
	^ self j + GtDummyExamplesExternalDependencies new j
]
