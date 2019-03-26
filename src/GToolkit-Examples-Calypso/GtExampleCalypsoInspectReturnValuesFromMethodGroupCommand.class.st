Class {
	#name : #GtExampleCalypsoInspectReturnValuesFromMethodGroupCommand,
	#superclass : #GtExampleCalypsoInspectReturnValuesCommand,
	#category : #'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectReturnValuesFromMethodGroupCommand class >> contextClass [
	^ ClyMethodGroup asCalypsoItemContext
]

{ #category : #private }
GtExampleCalypsoInspectReturnValuesFromMethodGroupCommand >> gtExamplesFrom: each [
	^ each actualObject methods flatCollect: #gtExamplesContained
]
