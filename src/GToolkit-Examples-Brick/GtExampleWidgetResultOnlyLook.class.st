Class {
	#name : #GtExampleWidgetResultOnlyLook,
	#superclass : #BrEntailmentLook,
	#instVars : [
		'resultStencilBuilder'
	],
	#category : #'GToolkit-Examples-Brick-Look'
}

{ #category : #initialization }
GtExampleWidgetResultOnlyLook >> initialize [
	super initialize.
	
	resultStencilBuilder := [ BlElement new ]
]

{ #category : #initialization }
GtExampleWidgetResultOnlyLook >> initializeListeners [
	super initializeListeners.

	self when: BrEntailmentConclusionChanged do: [ :anEvent | self resultStencil: anEvent stencil ]
]

{ #category : #initialization }
GtExampleWidgetResultOnlyLook >> initializeRequests [
	super initializeRequests.

	self request: BrEntailmentConclusionRequest new
]

{ #category : #accessing }
GtExampleWidgetResultOnlyLook >> resultStencil: aResultStencil [
	self
		assert: [ aResultStencil isNotNil ]
		description: [ 'Result stencil must not be nil' ].
	
	resultStencilBuilder := aResultStencil asStencil.
	self widgetDo: [ self updateWidget ]
]

{ #category : #updating }
GtExampleWidgetResultOnlyLook >> updateWidget [
	| aWidgetContent aResultElement |
	
	aWidgetContent := self widgetContent.
	aWidgetContent removeChildren.
	
	self hasExample
		ifFalse: [ ^ self ].

	aResultElement := (resultStencilBuilder example: self example) asElement.
	aWidgetContent addChild: aResultElement
]
