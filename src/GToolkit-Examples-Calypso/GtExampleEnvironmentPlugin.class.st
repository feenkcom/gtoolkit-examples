Class {
	#name : #GtExampleEnvironmentPlugin,
	#superclass : #ClySystemEnvironmentPlugin,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #testing }
GtExampleEnvironmentPlugin class >> isSlow [
	^ true
]

{ #category : #'item decoration' }
GtExampleEnvironmentPlugin >> decorateBrowserItem: anItem ofClass: aClass [
	| examples |
	examples := self examplesFor: aClass.
	examples ifEmpty: [ ^ self ].
	anItem addProperty: (GtExampleProperty examples: examples)
]

{ #category : #'item decoration' }
GtExampleEnvironmentPlugin >> decorateBrowserItem: anItem ofMethod: aMethod [
	| examples |
	examples := self examplesFor: aMethod.
	examples ifEmpty: [ ^ self ].
	anItem addProperty: (GtExampleProperty examples: examples)
]

{ #category : #'item decoration' }
GtExampleEnvironmentPlugin >> decorateBrowserItem: anItem ofMethodGroup: aMethodGroup [
	| examples |
	aMethodGroup class isBasedOnMethodTag ifFalse: [ ^ self ].
	examples := aMethodGroup methods flatCollect: [ :eachMethod | self examplesFor: eachMethod ].
	examples ifEmpty: [ ^ self ].
	anItem addProperty: (GtExampleProperty examples: examples)
]

{ #category : #'item decoration' }
GtExampleEnvironmentPlugin >> decorateBrowserItem: anItem ofPackage: aPackage [
	| examples |
	examples := self examplesFor: aPackage.
	examples ifEmpty: [ ^ self ].
	anItem addProperty: (GtExampleProperty examples: examples)
]

{ #category : #'examples lookup' }
GtExampleEnvironmentPlugin >> examplesFor: anObject [
	<return: #Array of: #GtExample>
	^ anObject gtExamplesContained
]
