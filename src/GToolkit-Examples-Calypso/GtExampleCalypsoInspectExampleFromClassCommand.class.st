Class {
	#name : #GtExampleCalypsoInspectExampleFromClassCommand,
	#superclass : #GtExampleCalypsoInspectExamplesCommand,
	#category : #'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectExampleFromClassCommand class >> contextClass [
	^ ClyClass asCalypsoItemContext 
]
