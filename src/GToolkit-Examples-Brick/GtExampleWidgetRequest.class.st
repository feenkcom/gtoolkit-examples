Class {
	#name : #GtExampleWidgetRequest,
	#superclass : #BrRequest,
	#category : #'GToolkit-Examples-Brick-Events'
}

{ #category : #initialization }
GtExampleWidgetRequest >> responseClass [
	^ GtExampleWidgetChanged
]
