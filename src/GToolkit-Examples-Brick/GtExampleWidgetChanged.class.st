"
I am sent by the ${class: GtExampleWidgetModel}$ when the example that it represents changes (not its source code)
"
Class {
	#name : #GtExampleWidgetChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'example'
	],
	#category : #'GToolkit-Examples-Brick-Events'
}

{ #category : #accessing }
GtExampleWidgetChanged >> example [
	^ example
]

{ #category : #accessing }
GtExampleWidgetChanged >> example: anObject [
	example := anObject
]
