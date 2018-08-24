Class {
	#name : #GtExampleProperty,
	#superclass : #ClyProperty,
	#instVars : [
		'examples'
	],
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleProperty class >> examples: aCollection [
	^ self new 
		examples: aCollection;
		yourself
]

{ #category : #accessing }
GtExampleProperty >> examples [
	^ examples
]

{ #category : #accessing }
GtExampleProperty >> examples: anObject [
	examples := anObject
]
