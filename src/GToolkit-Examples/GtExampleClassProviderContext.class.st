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

{ #category : #actions }
GtExampleClassProviderContext >> performAfterMethodForExample: anExample withReceiver: anObject [
	"Perform an example using a provider context and return its result"
	^ anObject 
		perform: anExample after method selector 
		withArguments: #()
]

{ #category : #actions }
GtExampleClassProviderContext >> performExample: anExample withReceiver: anObject [
	"Perform an example using a provider context and return its result"
	^ anObject 
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
