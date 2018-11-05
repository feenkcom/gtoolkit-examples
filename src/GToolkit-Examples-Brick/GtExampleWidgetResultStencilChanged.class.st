Class {
	#name : #GtExampleWidgetResultStencilChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'stencil'
	],
	#category : #'GToolkit-Examples-Brick-Events'
}

{ #category : #accessing }
GtExampleWidgetResultStencilChanged >> stencil [
	^ stencil
]

{ #category : #accessing }
GtExampleWidgetResultStencilChanged >> stencil: anObject [
	stencil := anObject
]
