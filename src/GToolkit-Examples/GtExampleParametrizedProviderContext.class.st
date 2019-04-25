Class {
	#name : #GtExampleParametrizedProviderContext,
	#superclass : #GtExampleProviderContext,
	#instVars : [
		'receiverClass',
		'arguments'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #testing }
GtExampleParametrizedProviderContext class >> canHandleCompiledMethod: aCompiledMethod [
	"Return true if a provider context can handle the compiled method"
	<return: #Boolean>
	^ aCompiledMethod numArgs > 0
]

{ #category : #'instance creation' }
GtExampleParametrizedProviderContext class >> compiledMethod: aCompiledMethod [
	"Return a concretee provider context instance"
	<return: #GtExampleProviderContext>
	| aDefaultArguments |
	aDefaultArguments := aCompiledMethod pragmas 
		select: [ :eachPragma | eachPragma selector = #value: ]
		thenCollect: [ :eachPragma | eachPragma arguments first ].
	^ self new arguments: aDefaultArguments
]

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
]

{ #category : #'instance creation' }
GtExampleParametrizedProviderContext >> newReceiver [
	^ self providerClass isMeta
		ifTrue: [ self providerClass instanceSide ]
		ifFalse: [ self providerClass instanceSide new ]
]

{ #category : #actions }
GtExampleParametrizedProviderContext >> performAfterMethodForExample: anExample withReceiver: anObject [
	"Perform an example using a provider context and return its result"
	^ anObject 
		perform: anExample after method selector 
		withArguments: self arguments
]

{ #category : #actions }
GtExampleParametrizedProviderContext >> performExample: anExample withReceiver: anObject [
	"Perform an example using a provider context and return its result"
	^ anObject 
		perform: anExample method selector 
		withArguments: self arguments
]

{ #category : #accessing }
GtExampleParametrizedProviderContext >> providerClass [
	<return: #Class or: #Metaclass>
	^ receiverClass
]

{ #category : #accessing }
GtExampleParametrizedProviderContext >> providerClass: aClass [
	receiverClass := aClass
]
