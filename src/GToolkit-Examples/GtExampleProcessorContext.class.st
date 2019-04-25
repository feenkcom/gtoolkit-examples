"
I am a utility that holds custom contextual information about the current example.
"
Class {
	#name : #GtExampleProcessorContext,
	#superclass : #IdentityDictionary,
	#instVars : [
		'example'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #accessing }
GtExampleProcessorContext >> example [
	^ example
]

{ #category : #accessing }
GtExampleProcessorContext >> example: anObject [
	example := anObject
]
