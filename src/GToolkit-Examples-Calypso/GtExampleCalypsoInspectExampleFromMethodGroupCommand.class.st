Class {
	#name : #GtExampleCalypsoInspectExampleFromMethodGroupCommand,
	#superclass : #GtExampleCalypsoInspectExamplesCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectExampleFromMethodGroupCommand class >> contextClass [
	^ ClyMethodGroup asCalypsoItemContext
]

{ #category : #private }
GtExampleCalypsoInspectExampleFromMethodGroupCommand >> gtExamplesFrom: each [
	^ each actualObject methods flatCollect: #gtExamplesContained
]
