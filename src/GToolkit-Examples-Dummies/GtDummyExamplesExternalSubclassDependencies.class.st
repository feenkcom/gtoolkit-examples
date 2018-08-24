Class {
	#name : #GtDummyExamplesExternalSubclassDependencies,
	#superclass : #GtDummyExamplesExternalDependencies,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesExternalSubclassDependencies >> iWithSelfSuperExternalDependencies [
	<gtExample>
	
	^ self j + super j + GtDummyExamplesExternalDependencies new j
]
