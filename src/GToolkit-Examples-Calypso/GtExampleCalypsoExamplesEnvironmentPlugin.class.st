Class {
	#name : #GtExampleCalypsoExamplesEnvironmentPlugin,
	#superclass : #ClySystemEnvironmentPlugin,
	#category : #'GToolkit-Examples-Calypso'
}

{ #category : #'item decoration' }
GtExampleCalypsoExamplesEnvironmentPlugin >> decorateBrowserItem: anItem ofMethod: aMethod [

	(aMethod isGTExampleMethod)
		ifFalse: [ ^self ].
	
	anItem addProperty: (GtExampleCalypsoExampleProperty new)
]
