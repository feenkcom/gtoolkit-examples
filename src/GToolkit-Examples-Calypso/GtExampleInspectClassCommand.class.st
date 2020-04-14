Class {
	#name : #GtExampleInspectClassCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'selectedItems'
	],
	#category : #'GToolkit-Examples-Calypso'
}

{ #category : #activation }
GtExampleInspectClassCommand class >> browserTabActivation [
	<classAnnotation>
	^ ClyBrowserTabCommandActivation for: self contextClass 
]

{ #category : #accessing }
GtExampleInspectClassCommand class >> contextClass [
	^ ClyClass asCalypsoItemContext
]

{ #category : #accessing }
GtExampleInspectClassCommand class >> defaultMenuIconName [
	^ #glamorousInspect
]

{ #category : #accessing }
GtExampleInspectClassCommand class >> defaultMenuItemName [
	^ 'Inspect classes'
]

{ #category : #activation }
GtExampleInspectClassCommand class >> menuItemOrder [
	^ 3
]

{ #category : #execution }
GtExampleInspectClassCommand >> execute [
	selectedItems do: [ :eachDataSourceItem | 
		(eachDataSourceItem actualObject respondsTo: #gtBrowse)
			ifTrue: [ eachDataSourceItem actualObject gtBrowse ]
			ifFalse: [ eachDataSourceItem actualObject inspect ] ]
]

{ #category : #execution }
GtExampleInspectClassCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	selectedItems := aToolContext selectedItems.
]
