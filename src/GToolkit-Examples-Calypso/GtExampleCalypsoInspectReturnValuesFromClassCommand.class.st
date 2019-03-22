Class {
	#name : #GtExampleCalypsoInspectReturnValuesFromClassCommand,
	#superclass : #GtExampleCalypsoInspectReturnValuesCommand,
	#category : #'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectReturnValuesFromClassCommand class >> contextClass [
	^ ClyClass asCalypsoItemContext 
]
