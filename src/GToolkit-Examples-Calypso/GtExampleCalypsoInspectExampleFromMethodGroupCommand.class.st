Class {
	#name : #GtExampleCalypsoInspectExampleFromMethodGroupCommand,
	#superclass : #GtExampleCalypsoInspectExamplesCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectExampleFromMethodGroupCommand class >> contextClass [
	^ ClyMethodGroup asCalypsoItemContext
]

{ #category : #activation }
GtExampleCalypsoInspectExampleFromMethodGroupCommand class >> fullBrowserTableIconActivation [
	<classAnnotation>
	^ ClyTableIconCommandActivation priority: self tableIconPriority for: self contextClass
]

{ #category : #private }
GtExampleCalypsoInspectExampleFromMethodGroupCommand >> gtExamplesFrom: each [
	^ each actualObject methods flatCollect: #gtExamplesContained
]
