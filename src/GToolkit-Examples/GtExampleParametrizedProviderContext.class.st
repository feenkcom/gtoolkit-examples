Class {
	#name : #GtExampleParametrizedProviderContext,
	#superclass : #GtExampleProviderContext,
	#instVars : [
		'providerClass',
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
]

{ #category : #accessing }
GtExampleParametrizedProviderContext >> newReceiver [
	^ self providerClass isMeta
		ifTrue: [ self providerClass instanceSide ]
		ifFalse: [ self providerClass instanceSide new ]
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
	<return: #GtExampleReceiver>
	^ GtExampleReceiver new 
		receiver: self newReceiver;
		arguments: self arguments
]
