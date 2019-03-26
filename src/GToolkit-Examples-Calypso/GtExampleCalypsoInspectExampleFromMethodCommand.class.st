Class {
	#name : #GtExampleCalypsoInspectExampleFromMethodCommand,
	#superclass : #GtExampleCalypsoInspectExamplesCommand,
	#category : #'GToolkit-Examples-Calypso'
}

{ #category : #testing }
GtExampleCalypsoInspectExampleFromMethodCommand class >> canBeExecutedInContext: aToolContext [

	^aToolContext selectedItems	anySatisfy: [ :each | each hasProperty: GtExampleCalypsoExampleProperty ]
]

{ #category : #activation }
GtExampleCalypsoInspectExampleFromMethodCommand class >> contextClass [
	^ ClyMethod asCalypsoItemContext 
]

{ #category : #activation }
GtExampleCalypsoInspectExampleFromMethodCommand class >> fullBrowserTableIconActivation [
	<classAnnotation>
	
	^ ClyTableIconCommandActivation priority: 1000 for: self contextClass
]
