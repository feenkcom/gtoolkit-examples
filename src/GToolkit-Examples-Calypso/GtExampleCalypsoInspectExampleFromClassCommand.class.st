Class {
	#name : #GtExampleCalypsoInspectExampleFromClassCommand,
	#superclass : #GtExampleCalypsoInspectExamplesCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectExampleFromClassCommand class >> contextClass [
	^ ClyClass asCalypsoItemContext 
]

{ #category : #activation }
GtExampleCalypsoInspectExampleFromClassCommand class >> fullBrowserTableIconActivation [
	<classAnnotation>
	^ ClyTableIconCommandActivation priority: self tableIconPriority for: self contextClass
]
