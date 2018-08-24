Class {
	#name : #GtExampleCalypsoInspectReturnValuesFromMethodCommand,
	#superclass : #GtExampleCalypsoInspectReturnValuesCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectReturnValuesFromMethodCommand class >> contextClass [
	^ ClyMethod asCalypsoItemContext 
]

{ #category : #activation }
GtExampleCalypsoInspectReturnValuesFromMethodCommand class >> fullBrowserTableIconActivation [
	<classAnnotation>
	^ ClyTableIconCommandActivation priority: self tableIconPriority for: self contextClass
]
