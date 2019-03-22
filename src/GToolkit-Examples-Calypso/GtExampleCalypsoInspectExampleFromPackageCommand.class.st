Class {
	#name : #GtExampleCalypsoInspectExampleFromPackageCommand,
	#superclass : #GtExampleCalypsoInspectExamplesCommand,
	#category : #'GToolkit-Examples-Calypso'
}

{ #category : #activation }
GtExampleCalypsoInspectExampleFromPackageCommand class >> contextClass [
	^ RPackage asCalypsoItemContext  
]

{ #category : #execution }
GtExampleCalypsoInspectExampleFromPackageCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	Sensor shiftPressed ifTrue: [ 
		selectedItems := aToolContext selectedClassItems ].
]
