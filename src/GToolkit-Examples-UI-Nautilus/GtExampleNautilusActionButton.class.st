"
I add a single button for running the example. If the example is not a success I run a second time the example in debug mode so that a debugger will be available. If the example is a success I open an inspector on the result value.
"
Class {
	#name : #GtExampleNautilusActionButton,
	#superclass : #GtAbstractExampleNautilusActionButton,
	#category : 'GToolkit-Examples-UI-Nautilus'
}

{ #category : #private }
GtExampleNautilusActionButton class >> methodUpdated: aCompiledMethod with: aResult [
	MethodWidget methodsIconsCache 
		at: aCompiledMethod 
		ifPresent: [ :holder | 
			holder labelGraphic: (self iconForMethod: aCompiledMethod result: aResult) ]
]

{ #category : #order }
GtExampleNautilusActionButton >> privateActionIcon [
	"Return the icon for this action"
	^ IconicButton new
		target: self;
		actionSelector: #run:;
		arguments: { method };
		labelGraphic: (self class iconForMethod: method result: nil);
		color: Color transparent;
		helpText: 'Run';
		extent: 16 @ 16;
		borderWidth: 0
]

{ #category : #private }
GtExampleNautilusActionButton >> run: aCompiledMethod [
	aCompiledMethod gtExample ifNotNil: [ :example | 
		example result ifNotNil: [ :result |
			result isSuccess 
				ifTrue: [ result returnValue inspect ]
				ifFalse: [ example debug ] ] ]
]
