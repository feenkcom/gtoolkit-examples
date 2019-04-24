Class {
	#name : #GtExampleClassProviderContext,
	#superclass : #GtExampleProviderContext,
	#instVars : [
		'providerClass',
		'receiver',
		'isReceiverInitialized'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #initialization }
GtExampleClassProviderContext >> initialize [
	super initialize.
	providerClass := nil.
	receiver := nil.
	isReceiverInitialized := false.
]

{ #category : #'instance creation' }
GtExampleClassProviderContext >> newReceiver [
	^ self providerClass isMeta
		ifTrue: [ self providerClass instanceSide ]
		ifFalse: [ self providerClass instanceSide new ]
]

{ #category : #actions }
GtExampleClassProviderContext >> performAfterMethodForExample: anExample [
	"Perform an example using a provider context and return its result"
	^ self receiver 
		perform: anExample after method selector 
		withArguments: #()
]

{ #category : #actions }
GtExampleClassProviderContext >> performExample: anExample [
	"Perform an example using a provider context and return its result"
	^ self receiver 
		perform: anExample method selector 
		withArguments: #()
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
	isReceiverInitialized ifFalse: [ 
		receiver := self newReceiver. 
		isReceiverInitialized := true ].
	^ receiver
]
