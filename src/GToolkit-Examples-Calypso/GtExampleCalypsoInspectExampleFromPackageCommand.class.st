Class {
	#name : #GtExampleCalypsoInspectExampleFromPackageCommand,
	#superclass : #GtExampleCalypsoInspectExamplesCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #activation }
GtExampleCalypsoInspectExampleFromPackageCommand class >> contextClass [
	^ RPackage asCalypsoItemContext  
]

{ #category : #activation }
GtExampleCalypsoInspectExampleFromPackageCommand class >> fullBrowserTableIconActivation [
	<classAnnotation>
	^ ClyTableIconCommandActivation priority: self tableIconPriority for: self contextClass
]

{ #category : #activation }
GtExampleCalypsoInspectExampleFromPackageCommand class >> fullBrowserToolbarContextActivation [
	<classAnnotation>
	^ ClyToolbarCommandActivation
		byItemOf: ClyButtonToolbarGroup for: self contextClass
]

{ #category : #execution }
GtExampleCalypsoInspectExampleFromPackageCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	Sensor shiftPressed ifTrue: [ 
		selectedItems := aToolContext selectedClassItems ].
]
