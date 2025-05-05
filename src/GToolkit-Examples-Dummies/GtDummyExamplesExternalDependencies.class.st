Class {
	#name : #GtDummyExamplesExternalDependencies,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesExternalDependencies >> a [
	<gtExample>
	<return: #SmallInteger>
	^ GtDummyExamplesOnInstanceSide new b + GtDummyExamplesOnInstanceSide new c
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> b [
	<gtExample>
	<return: #SmallInteger>
	^ 38 + GtDummyExamplesOnInstanceSide new c
		+ GtDummyExamplesOnInstanceSide new d
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> c [
	<gtExample>
	<return: #SmallInteger>
	^ 41
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> e [
	<gtExample>
	<return: #SmallInteger>
	^ GtDummyExamplesOnInstanceSide new e
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> fWithIndirectExtenalDependency [
	<gtExample>
	<return: #SmallInteger>
	^ self e
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> gWithDirectAndIndirectDependencies [
	<gtExample>
	<return: #SmallInteger>
	^ self e
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> hWithSelfAndExternalDependencies [
	<gtExample>
	<return: #SmallInteger>
	^ self c + GtDummyExamplesOnInstanceSide new e
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> j [
	<gtExample>
	<return: #SmallInteger>
	^ 1
]

{ #category : #examples }
GtDummyExamplesExternalDependencies >> kWithSelfAndExternalForSameMethod [
	<gtExample>
	<return: #SmallInteger>
	^ self j + GtDummyExamplesExternalDependencies new j
]
