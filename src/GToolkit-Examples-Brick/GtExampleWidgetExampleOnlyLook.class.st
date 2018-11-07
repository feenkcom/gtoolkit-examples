Class {
	#name : #GtExampleWidgetExampleOnlyLook,
	#superclass : #BrEntailmentLook,
	#instVars : [
		'exampleStencilBuilder'
	],
	#category : #'GToolkit-Examples-Brick-Look'
}

{ #category : #accessing }
GtExampleWidgetExampleOnlyLook >> exampleStencil: anExampleStencil [
	self
		assert: [ anExampleStencil isNotNil ]
		description: [ 'Example stencil must not be nil' ].

	exampleStencilBuilder := anExampleStencil asStencil.
	self widgetDo: [ self updateWidget ]
]

{ #category : #initialization }
GtExampleWidgetExampleOnlyLook >> initialize [
	super initialize.
	
	exampleStencilBuilder := [ BlElement new ] asStencil
]

{ #category : #initialization }
GtExampleWidgetExampleOnlyLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrEntailmentPremiseChanged do: [ :anEvent | self exampleStencil: anEvent stencil ].
]

{ #category : #initialization }
GtExampleWidgetExampleOnlyLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrEntailmentPremiseRequest new
]

{ #category : #updating }
GtExampleWidgetExampleOnlyLook >> updateWidget [
	| aWidgetContent anExampleElement |
	
	aWidgetContent := self widgetContent.
	aWidgetContent removeChildren.
	
	self hasExample
		ifFalse: [ ^ self ].
	
	anExampleElement := (exampleStencilBuilder example: self example) asElement.
	aWidgetContent addChild: anExampleElement
]
