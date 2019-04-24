Class {
	#name : #GtExampleReceiver,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'arguments'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtExampleReceiver >> arguments [
	^ arguments
]

{ #category : #accessing }
GtExampleReceiver >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
GtExampleReceiver >> receiver [
	^ receiver
]

{ #category : #accessing }
GtExampleReceiver >> receiver: anObject [
	receiver := anObject
]
