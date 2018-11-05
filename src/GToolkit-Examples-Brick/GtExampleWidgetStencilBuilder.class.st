"
I define a transformation from the GtExample to the visual representation of for example itself.
In most cases it is a method coder widget
"
Class {
	#name : #GtExampleWidgetStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'example'
	],
	#category : #'GToolkit-Examples-Brick-Stencil'
}

{ #category : #'api - instantiation' }
GtExampleWidgetStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlElement new
]

{ #category : #accessing }
GtExampleWidgetStencilBuilder >> example [
	^ example
]

{ #category : #accessing }
GtExampleWidgetStencilBuilder >> example: anObject [
	example := anObject
]

{ #category : #'api - instantiation' }
GtExampleWidgetStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor push: self example
]
