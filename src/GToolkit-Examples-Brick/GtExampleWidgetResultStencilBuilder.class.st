"
I define a transformation from the GtExample to the visual representation of its result
"
Class {
	#name : #GtExampleWidgetResultStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'example'
	],
	#category : #'GToolkit-Examples-Brick-Stencil'
}

{ #category : #'api - instantiation' }
GtExampleWidgetResultStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlElement new
]

{ #category : #accessing }
GtExampleWidgetResultStencilBuilder >> example [
	^ example
]

{ #category : #accessing }
GtExampleWidgetResultStencilBuilder >> example: anObject [
	example := anObject
]

{ #category : #'api - instantiation' }
GtExampleWidgetResultStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor push: self example
]
