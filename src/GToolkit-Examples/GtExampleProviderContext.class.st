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
GtExampleProviderContext >> performAfterMethodForExample: anExample [
	"Perform an after method for the example using a provider context and return its result"
	^ self subclassResponsibility
]

{ #category : #actions }
GtExampleProviderContext >> performExample: anExample [
	"Perform an example using a provider context and return its result"
	^ self subclassResponsibility
]

{ #category : #accessing }
GtExampleProviderContext >> receiver [
	"Return a new or previously created receiver (object) that performs (performed) an example"
	^ self subclassResponsibility
]
