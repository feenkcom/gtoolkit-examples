Class {
	#name : #GtExampleClassProviderContext,
	#superclass : #GtExampleProviderContext,
	#instVars : [
		'providerClass'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #'instance creation' }
GtExampleClassProviderContext >> newReceiver [
	^ self providerClass isMeta
		ifTrue: [ self providerClass instanceSide ]
		ifFalse: [ self providerClass instanceSide new ]
]

{ #category : #accessing }
GtExampleClassProviderContext >> providerClass [
	<return: #Class or: #Metaclass>
	^ providerClass
]

{ #category : #accessing }
GtExampleClassProviderContext >> providerClass: aClass [
	providerClass := aClass
]

{ #category : #'instance creation' }
GtExampleClassProviderContext >> receiver [
	<return: #GtExampleReceiver>
	^ GtExampleReceiver new 
		receiver: self newReceiver;
		arguments: #()
]
