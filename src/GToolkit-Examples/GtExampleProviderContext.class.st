Class {
	#name : #GtExampleProviderContext,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtExampleProviderContext >> receiver [
	<return: #GtExampleReceiver>
	^ self subclassResponsibility
]
