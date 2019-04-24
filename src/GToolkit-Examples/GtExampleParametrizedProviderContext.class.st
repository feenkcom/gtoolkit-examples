Class {
	#name : #GtExampleParametrizedProviderContext,
	#superclass : #GtExampleProviderContext,
	#instVars : [
		'providerClass',
		'receiver',
		'isReceiverInitialized',
		'arguments'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtExampleParametrizedProviderContext >> arguments [
	^ arguments
]

{ #category : #accessing }
GtExampleParametrizedProviderContext >> arguments: anArray [
	arguments := anArray
]

{ #category : #initialization }
GtExampleParametrizedProviderContext >> initialize [
	super initialize.
	arguments := #().
	providerClass := nil.
	receiver := nil.
	isReceiverInitialized := false.
]

{ #category : #accessing }
GtExampleParametrizedProviderContext >> newReceiver [
	^ self providerClass isMeta
		ifTrue: [ self providerClass instanceSide ]
		ifFalse: [ self providerClass instanceSide new ]
]

{ #category : #actions }
GtExampleParametrizedProviderContext >> performAfterMethodForExample: anExample [
	"Perform an example using a provider context and return its result"
	^ self receiver 
		perform: anExample after method selector 
		withArguments: self arguments
]

{ #category : #actions }
GtExampleParametrizedProviderContext >> performExample: anExample [
	"Perform an example using a provider context and return its result"
	^ self receiver 
		perform: anExample method selector 
		withArguments: self arguments
]

{ #category : #accessing }
GtExampleParametrizedProviderContext >> provider [
	^ self providerClass isMeta
		ifTrue: [ self providerClass instanceSide ]
		ifFalse: [ self providerClass instanceSide new ]
]

{ #category : #accessing }
GtExampleParametrizedProviderContext >> providerClass [
	<return: #Class or: #Metaclass>
	^ providerClass
]

{ #category : #accessing }
GtExampleParametrizedProviderContext >> providerClass: aClass [
	providerClass := aClass
]

{ #category : #accessing }
GtExampleParametrizedProviderContext >> receiver [
	isReceiverInitialized ifFalse: [ 
		receiver := self newReceiver. 
		isReceiverInitialized := true ].
	^ receiver
]
