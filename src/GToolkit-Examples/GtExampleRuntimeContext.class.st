"
I am a utility that holds custom contextual information about the current example.


"
Class {
	#name : 'GtExampleRuntimeContext',
	#superclass : 'IdentityDictionary',
	#instVars : [
		'example'
	],
	#category : 'GToolkit-Examples-Runtime'
}

{ #category : 'accessing' }
GtExampleRuntimeContext >> example [
	^ example
]

{ #category : 'accessing' }
GtExampleRuntimeContext >> example: anObject [
	example := anObject
]
