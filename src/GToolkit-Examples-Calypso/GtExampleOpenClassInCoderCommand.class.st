Class {
	#name : #GtExampleOpenClassInCoderCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'selectedItems'
	],
	#category : #'GToolkit-Examples-Calypso'
}

{ #category : #activation }
GtExampleOpenClassInCoderCommand class >> browserTabActivation [
	<classAnnotation>
	^ ClyBrowserTabCommandActivation for: self contextClass 
]

{ #category : #testing }
GtExampleOpenClassInCoderCommand class >> canBeExecutedInContext: aToolContext [
	^ (super canBeExecutedInContext: aToolContext) and: [ 
			self environment hasClassNamed: #GtPharoBehaviorCoder ]
]

{ #category : #accessing }
GtExampleOpenClassInCoderCommand class >> contextClass [
	^ ClyClass asCalypsoItemContext
]

{ #category : #accessing }
GtExampleOpenClassInCoderCommand class >> defaultMenuIconName [
	^ #glamorousEdit
]

{ #category : #accessing }
GtExampleOpenClassInCoderCommand class >> defaultMenuItemName [
	^ 'Open in Coder'
]

{ #category : #activation }
GtExampleOpenClassInCoderCommand class >> menuItemOrder [
	^ 10
]

{ #category : #execution }
GtExampleOpenClassInCoderCommand >> execute [
	selectedItems
		do: [ :eachDataSourceItem | 
			((self class environment at: #GtCoder)
				forClass: eachDataSourceItem actualObject)
					openInPager maximized ]
]

{ #category : #execution }
GtExampleOpenClassInCoderCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	selectedItems := aToolContext selectedItems.
]
