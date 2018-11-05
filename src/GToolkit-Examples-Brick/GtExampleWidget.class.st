"
I am a widget that represents a GT-Example.

I can be embedded in various contexts
"
Class {
	#name : #GtExampleWidget,
	#superclass : #BlElement,
	#category : #'GToolkit-Examples-Brick-UI'
}

{ #category : #accessing }
GtExampleWidget >> example [
	<return: #GtExample>

	^ self viewModel example
]

{ #category : #accessing }
GtExampleWidget >> example: aGtExample [
	self viewModel example: aGtExample
]

{ #category : #accessing }
GtExampleWidget >> exampleStencil: anExampleStencil [
	"Define how example itself (usually its source code) should be visually represented"

	self viewModel exampleStencil: anExampleStencil
]

{ #category : #initialization }
GtExampleWidget >> initialize [
	super initialize.
	
	self viewModel: GtExampleWidgetModel new
]

{ #category : #accessing }
GtExampleWidget >> resultStencil: aResultStencil [
	"Define how example's result should be visually represented"

	self viewModel resultStencil: aResultStencil
]
