Class {
	#name : #GtExampleWidgetLook,
	#superclass : #BrLook,
	#instVars : [
		'example'
	],
	#category : #'GToolkit-Examples-Brick-Look'
}

{ #category : #accessing }
GtExampleWidgetLook >> example [
	<return: #GtExample>

	^ example
]

{ #category : #accessing }
GtExampleWidgetLook >> example: aGtExample [
	example := aGtExample.
	self widgetDo: [ self updateWidget ]
]

{ #category : #testing }
GtExampleWidgetLook >> hasExample [
	<return: #Boolean>

	^ example isNotNil
]

{ #category : #initialization }
GtExampleWidgetLook >> initialize [
	super initialize.
	
	example := nil "for performance reasons we do nothing if there is no example set"
]

{ #category : #initialization }
GtExampleWidgetLook >> initializeListeners [
	super initializeListeners.
	
	self when: GtExampleWidgetChanged do: [ :anEvent | self example: anEvent example ]
]

{ #category : #initialization }
GtExampleWidgetLook >> initializeLook [
	super initializeLook.
	
	self updateWidget
]

{ #category : #initialization }
GtExampleWidgetLook >> initializeRequests [
	super initializeRequests.
	
	self request: GtExampleWidgetRequest new
]

{ #category : #updating }
GtExampleWidgetLook >> updateWidget [
	
]
