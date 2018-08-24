"
I am work in progress for showing next to the method an widget with multiple actions.
"
Class {
	#name : #GtExampleNautilusDualActionButton,
	#superclass : #GtAbstractExampleNautilusActionButton,
	#instVars : [
		'result'
	],
	#category : 'GToolkit-Examples-UI-Nautilus'
}

{ #category : #private }
GtExampleNautilusDualActionButton class >> methodUpdated: aCompiledMethod with: aResult [
	MethodWidget methodsIconsCache 
		at: aCompiledMethod 
		ifPresent: [ :array | 
			array second labelGraphic: (self iconForMethod: aCompiledMethod result: aResult) ]
]

{ #category : #private }
GtExampleNautilusDualActionButton >> actionInspectExample [
	^ IconicButton new
		target: self;
		actionSelector: #inspectExample:;
		arguments: { method };
		color: Color transparent;
		helpText: 'Inspect Example';
		extent: 16 @ 8;
		borderWidth: 0
]

{ #category : #private }
GtExampleNautilusDualActionButton >> actionInspectReturnValue [
	^ IconicButton new
		target: self;
		actionSelector: #inspectReturnValue:;
		arguments: { method };
		color: Color transparent;
		helpText: 'Inspect Return-Value';
		extent: 16 @ 8;
		borderWidth: 0
]

{ #category : #order }
GtExampleNautilusDualActionButton >> actionStateToCache [
	"Return the state of the icon for caching purpose"
	^ result 
		ifNil: [ super actionStateToCache ]
		ifNotNil: [ self exampleStateToCache ]
]

{ #category : #private }
GtExampleNautilusDualActionButton >> actions [
	| action1 action2 |
	^ result := ((Morph new
		extent: 16@16;
		color: Color transparent;
		borderWidth: 0;
		changeTableLayout;
		listDirection: #topToBottom;
		addMorph: (action1 := self actionInspectExample);
		addMorph: (action2 := self actionInspectReturnValue);
		yourself) -> { action1. action2 })
]

{ #category : #private }
GtExampleNautilusDualActionButton >> exampleStateToCache [
	^ {
		IconicButtonStateHolder forNautilus: result value first. 
		IconicButtonStateHolder forNautilus: result value second } 
]

{ #category : #private }
GtExampleNautilusDualActionButton >> inspectExample: aCompiledMethod [
	aCompiledMethod gtExample 
		ifNotNil: [ :example | example inspect ]
		ifNil: [ self notifyNoExample: aCompiledMethod ]
]

{ #category : #private }
GtExampleNautilusDualActionButton >> inspectReturnValue: aCompiledMethod [
	aCompiledMethod gtExample 
		ifNotNil: [ :example | 
			example result 
				ifNotNil: [ :exampleResult |
					exampleResult isSuccess 
						ifTrue: [ result returnValue inspect ]
						ifFalse: [ example debug ] ] ]
		ifNil: [ self notifyNoExample: aCompiledMethod ]
]

{ #category : #private }
GtExampleNautilusDualActionButton >> notifyNoExample: aCompiledMethod [
	GrowlMorph 
		openWithLabel: 'No valid example in'
		contents: aCompiledMethod gtDisplayString
]

{ #category : #private }
GtExampleNautilusDualActionButton >> privateActionIcon [
	^ self actions key
]
