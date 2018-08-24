Class {
	#name : #GtExampleCalypsoInspectReturnValuesCommand,
	#superclass : #GtExampleCalypsoCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectReturnValuesCommand class >> defaultMenuIconName [
	^ #glamorousInspect
]

{ #category : #accessing }
GtExampleCalypsoInspectReturnValuesCommand class >> defaultMenuItemName [
	^ 'Inspect return-values'
]

{ #category : #activation }
GtExampleCalypsoInspectReturnValuesCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>
	^ CmdShortcutCommandActivation by: $e meta , $v meta for: self contextClass
]

{ #category : #accessing }
GtExampleCalypsoInspectReturnValuesCommand class >> menuItemOrder [
	^ 2
]

{ #category : #execution }
GtExampleCalypsoInspectReturnValuesCommand >> executeOnExampleGroup: aGtExampleGroup [ 
	Sensor shiftPressed 
		ifTrue: [ self inspectExamplesOnExampleGroup: aGtExampleGroup ] 
		ifFalse: [ self inspectReturnValuesOnExampleGroup: aGtExampleGroup ]
]
