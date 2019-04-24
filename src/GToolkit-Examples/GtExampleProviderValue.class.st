Class {
	#name : #GtExampleProviderValue,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'providerContext'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #actions }
GtExampleProviderValue >> performAfterMethodForExample: anExample [
	"Perform an example using a provider context and return its result"
	^ self providerContext performAfterMethodForExample: anExample withReceiver: self receiver
]

{ #category : #actions }
GtExampleProviderValue >> performExample: anExample [
	"Perform an example using a provider context and return its result"
	^ self providerContext performExample: anExample withReceiver: self receiver
]

{ #category : #accessing }
GtExampleProviderValue >> providerContext [
	<return: #GtExampleProviderContext>
	^ providerContext
]

{ #category : #accessing }
GtExampleProviderValue >> providerContext: anObject [
	providerContext := anObject
]

{ #category : #accessing }
GtExampleProviderValue >> receiver [
	^ receiver
]

{ #category : #accessing }
GtExampleProviderValue >> receiver: anObject [
	receiver := anObject
]
