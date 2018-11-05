Class {
	#name : #GtExampleWidgetExampleOnlyLook,
	#superclass : #GtExampleWidgetLook,
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

	exampleStencilBuilder := anExampleStencil asStencilBuilder: GtExampleWidgetStencilBuilder.
	self widgetDo: [ self updateWidget ]
]

{ #category : #initialization }
GtExampleWidgetExampleOnlyLook >> initialize [
	super initialize.
	
	exampleStencilBuilder := GtExampleWidgetStencilBuilder new
]

{ #category : #initialization }
GtExampleWidgetExampleOnlyLook >> initializeListeners [
	super initializeListeners.
	
	self when: GtExampleWidgetExampleStencilChanged do: [ :anEvent | self exampleStencil: anEvent stencil ].
]

{ #category : #initialization }
GtExampleWidgetExampleOnlyLook >> initializeRequests [
	super initializeRequests.
	
	self request: GtExampleWidgetExampleStencilRequest new
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
