Class {
	#name : #GtExampleWidgetModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'example',
		'exampleStencilBuilder',
		'resultStencilBuilder'
	],
	#category : #'GToolkit-Examples-Brick-Model'
}

{ #category : #accessing }
GtExampleWidgetModel >> example [
	<return: #GtExample>

	^ example
]

{ #category : #accessing }
GtExampleWidgetModel >> example: aGtExample [
	example := aGtExample.
	self notifyExampleChanged: aGtExample
]

{ #category : #accessing }
GtExampleWidgetModel >> exampleStencil: anExampleStencil [
	exampleStencilBuilder := anExampleStencil asStencilBuilder: GtExampleWidgetStencilBuilder.
	self notifyExampleStencilChanged: exampleStencilBuilder
]

{ #category : #initialization }
GtExampleWidgetModel >> initialize [
	super initialize.

	exampleStencilBuilder := GtExampleWidgetStencilBuilder new.
	resultStencilBuilder := GtExampleWidgetResultStencilBuilder new
]

{ #category : #initialization }
GtExampleWidgetModel >> initializeListeners [
	super initializeListeners.

	self when: GtExampleWidgetRequest reply: [ :aResponse | aResponse example: self example ].
	self when: GtExampleWidgetExampleStencilRequest reply: [ :aResponse | aResponse stencil: exampleStencilBuilder ].
	self when: GtExampleWidgetResultStencilRequest reply: [ :aResponse | aResponse stencil: resultStencilBuilder ]
]

{ #category : #notifying }
GtExampleWidgetModel >> notifyExampleChanged: aGtExample [
	self dispatchEvent: (GtExampleWidgetChanged new example: aGtExample)
]

{ #category : #notifying }
GtExampleWidgetModel >> notifyExampleStencilChanged: anExampleStencil [
	self dispatchEvent: (GtExampleWidgetExampleStencilChanged new stencil: anExampleStencil)
]

{ #category : #notifying }
GtExampleWidgetModel >> notifyResultStencilChanged: anExampleStencil [
	self dispatchEvent: (GtExampleWidgetResultStencilChanged new stencil: anExampleStencil)
]

{ #category : #accessing }
GtExampleWidgetModel >> resultStencil: anExampleStencil [
	resultStencilBuilder := anExampleStencil asStencilBuilder: GtExampleWidgetResultStencilBuilder.
	self notifyResultStencilChanged: resultStencilBuilder
]
