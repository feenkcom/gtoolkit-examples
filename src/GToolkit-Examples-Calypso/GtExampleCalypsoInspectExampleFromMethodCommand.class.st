Class {
	#name : #GtExampleCalypsoInspectExampleFromMethodCommand,
	#superclass : #GtExampleCalypsoInspectExamplesCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #activation }
GtExampleCalypsoInspectExampleFromMethodCommand class >> contextClass [
	^ ClyMethod asCalypsoItemContext 
]
