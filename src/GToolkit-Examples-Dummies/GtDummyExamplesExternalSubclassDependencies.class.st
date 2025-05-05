Class {
	#name : #GtDummyExamplesExternalSubclassDependencies,
	#superclass : #GtDummyExamplesExternalDependencies,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesExternalSubclassDependencies >> iWithSelfSuperExternalDependencies [
	<gtExample>
	<return: #SmallInteger>
	^ self j + super j + GtDummyExamplesExternalDependencies new j
]

{ #category : #examples }
GtDummyExamplesExternalSubclassDependencies >> kWithSelfSuperExternalDependenciesToMethodInSubclass [
	<gtExample>
	<return: #SmallInteger>
	^ self j + super j + GtDummyExamplesExternalSubclassDependencies new j
]
