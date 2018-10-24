Class {
	#name : #GtClassExampleGroup,
	#superclass : #GtDynamicExampleGroup,
	#instVars : [
		'exampleClass',
		'examples'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtClassExampleGroup >> exampleClass [
	^ exampleClass
]

{ #category : #accessing }
GtClassExampleGroup >> exampleClass: aClass [
	exampleClass := aClass.
	examples := exampleClass gtExamplesContained collect: [ :each | each asExampleWithResult ]
]

{ #category : #accessing }
GtClassExampleGroup >> examples [
	^ examples
]
