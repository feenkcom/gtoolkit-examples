Class {
	#name : #GtExampleCalypsoInspectReturnValuesFromMethodCommand,
	#superclass : #GtExampleCalypsoInspectReturnValuesCommand,
	#category : #'GToolkit-Examples-Calypso'
}

{ #category : #testing }
GtExampleCalypsoInspectReturnValuesFromMethodCommand class >> canBeExecutedInContext: aToolContext [

	^aToolContext selectedItems	anySatisfy: [ :each | each hasProperty: GtExampleCalypsoExampleProperty ]
]

{ #category : #accessing }
GtExampleCalypsoInspectReturnValuesFromMethodCommand class >> contextClass [
	^ ClyMethod asCalypsoItemContext 
]

{ #category : #activation }
GtExampleCalypsoInspectReturnValuesFromMethodCommand class >> fullBrowserTableIconActivation [
	<classAnnotation>
	
	^ ClyTableIconCommandActivation priority: 1000 for: self contextClass
]
