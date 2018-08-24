Class {
	#name : #GtExampleCalypsoInspectExamplesCommand,
	#superclass : #GtExampleCalypsoCommand,
	#category : 'GToolkit-Examples-Calypso'
}

{ #category : #accessing }
GtExampleCalypsoInspectExamplesCommand class >> defaultMenuIconName [
	^ #glamorousInspect
]

{ #category : #accessing }
GtExampleCalypsoInspectExamplesCommand class >> defaultMenuItemName [
	^ 'Inspect examples'
]

{ #category : #activation }
GtExampleCalypsoInspectExamplesCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>
	^ CmdShortcutCommandActivation by: $e meta , $i meta for: self contextClass
]

{ #category : #accessing }
GtExampleCalypsoInspectExamplesCommand class >> menuItemOrder [
	^ 1
]

{ #category : #accessing }
GtExampleCalypsoInspectExamplesCommand >> defaultToolbarItemName [
	^ 'Examples'
]

{ #category : #execution }
GtExampleCalypsoInspectExamplesCommand >> executeOnExampleGroup: aGtExampleGroup [ 
	Sensor shiftPressed 
		ifFalse: [ self inspectExamplesOnExampleGroup: aGtExampleGroup ] 
		ifTrue: [ self inspectReturnValuesOnExampleGroup: aGtExampleGroup ]
]
