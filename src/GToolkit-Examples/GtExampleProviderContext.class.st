Class {
	#name : #GtExampleProviderContext,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Core'
}

{ #category : #testing }
GtExampleProviderContext class >> canHandleCompiledMethod: aCompiledMethod [
	"Return true if a provider context can handle the compiled method"
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
GtExampleProviderContext class >> compiledMethod: aCompiledMethod [
	"Return a concretee provider context instance"
	<return: #GtExampleProviderContext>
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
GtExampleProviderContext class >> fromCompiledMethod: aCompiledMethod [
	self allSubclassesDo: [ :eachSubclass | 
		(eachSubclass canHandleCompiledMethod: aCompiledMethod)
			ifTrue: [ ^ eachSubclass compiledMethod: aCompiledMethod ] ].
	self error: 'There is no a provider context for ', aCompiledMethod printString.
]

{ #category : #'instance creation' }
GtExampleProviderContext >> newReceiver [
	"Return a new receiver (object) to perform an example"
	^ self subclassResponsibility
]

{ #category : #actions }
GtExampleProviderContext >> performAfterMethodForExample: anExample withReceiver: anObject [
	"Perform an after method for the example using a provider context and return its result"
	^ self subclassResponsibility
]

{ #category : #actions }
GtExampleProviderContext >> performExample: anExample withReceiver: anObject [
	"Perform an example using a provider context and return its result"
	^ self subclassResponsibility
]

{ #category : #accessing }
GtExampleProviderContext >> providerValue [
	<return: #GtExampleProviderValue>
	^ GtExampleProviderValue new
			providerContext: self;
			receiver: self newReceiver
]
