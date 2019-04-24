Class {
	#name : #GtExampleProviderContext,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Core'
}

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
