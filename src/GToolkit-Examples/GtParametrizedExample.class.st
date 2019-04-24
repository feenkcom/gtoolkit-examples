Class {
	#name : #GtParametrizedExample,
	#superclass : #GtExample,
	#instVars : [
		'providerContext'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #initialization }
GtParametrizedExample >> initialize [
	super initialize.
	providerContext := nil.
]

{ #category : #accessing }
GtParametrizedExample >> providerContext [
	<return: #GtExampleProviderContext>
	self 
		assert: [ providerContext isNotNil ] 
		description: [ 'Parametrized context must be initialized before using it' ].
	^ providerContext
]

{ #category : #accessing }
GtParametrizedExample >> providerContext: aGtExampleProviderContext [
	providerContext := aGtExampleProviderContext
]
