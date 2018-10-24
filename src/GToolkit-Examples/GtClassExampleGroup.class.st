Class {
	#name : #GtClassExampleGroup,
	#superclass : #GtDynamicExampleGroup,
	#instVars : [
		'exampleClass'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtClassExampleGroup >> exampleClass [
	^ exampleClass
]

{ #category : #accessing }
GtClassExampleGroup >> exampleClass: anObject [
	exampleClass := anObject
]

{ #category : #accessing }
GtClassExampleGroup >> examples [
	^  exampleClass gtExamplesContained
]
