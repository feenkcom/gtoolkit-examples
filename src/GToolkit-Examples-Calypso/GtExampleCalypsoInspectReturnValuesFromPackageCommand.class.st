Class {
	#name : #GtExampleCalypsoInspectReturnValuesFromPackageCommand,
	#superclass : #GtExampleCalypsoInspectReturnValuesCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectReturnValuesFromPackageCommand class >> contextClass [
	^ RPackage asCalypsoItemContext  
]
