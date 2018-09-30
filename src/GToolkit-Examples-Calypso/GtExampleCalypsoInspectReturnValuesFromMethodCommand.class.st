Class {
	#name : #GtExampleCalypsoInspectReturnValuesFromMethodCommand,
	#superclass : #GtExampleCalypsoInspectReturnValuesCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectReturnValuesFromMethodCommand class >> contextClass [
	^ ClyMethod asCalypsoItemContext 
]
