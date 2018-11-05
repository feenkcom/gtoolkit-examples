Class {
	#name : #GtExampleWidgetExampleStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'GToolkit-Examples-Brick-Events'
}

{ #category : #accessing }
GtExampleWidgetExampleStencilChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
GtExampleWidgetExampleStencilChanged >> stencil: anObject [
	stencil := anObject
]
