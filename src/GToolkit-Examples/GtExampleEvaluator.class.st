"
I am a processor that evaluates an example as if it is a test and caches the result. In case of an error I capture it and handle it according to the exceptions defined in the example.
"
Class {
	#name : #GtExampleEvaluator,
	#superclass : #GtExampleProcessor,
	#instVars : [
		'result'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #private }
GtExampleEvaluator >> basicProcess: anExample [
	| currentResult exampleReceiver dependencies |
	context example: anExample.

	dependencies := self dependenciesFor: anExample.
	currentResult := self newResultFor: anExample.
	exampleReceiver := anExample receiver.
	
	[ currentResult returnValue: (self primitiveProcessExample: anExample withReceiver: exampleReceiver) ] 
		ensure: [ 
			self processAfter: anExample withDependencies: dependencies andReceiver: exampleReceiver ].
	
	^ currentResult
]

{ #category : #accessing }
GtExampleEvaluator >> dependenciesFor: anExample [
	| dependencies traversal |
	dependencies := OrderedCollection new.
	traversal := anExample traverser
		action: [ :anotherExample | 
			(dependencies includes: anotherExample) ifFalse: [ 
				dependencies add: anotherExample ] ];
		yourself.
	 traversal value.
	(dependencies anySatisfy: [ :anotherExample | anotherExample isValid not ])
		ifTrue: [ ^ self handleDependencyErrorFor: anExample ].
	^ dependencies
]

{ #category : #private }
GtExampleEvaluator >> do: aBlock on: anException do: anotherBlock [
	"I give a chance to my subclass to not handle the exception is needed"
	aBlock
		on: anException
		do: anotherBlock
]

{ #category : #private }
GtExampleEvaluator >> handleDependencyErrorFor: anExample [
	^ (GtExampleDependencyError new
		example: anExample;
		defined: anExample arguments;
		expected: anExample methodArgumentNames;
		invalid: #();
		yourself) signal
]

{ #category : #private }
GtExampleEvaluator >> newResultFor: anExample [
	^ GtExampleResult new 
		example: anExample;
		context: self context;
		yourself.
]

{ #category : #primitives }
GtExampleEvaluator >> primitiveProcessExample: anExample withReceiver: anExampleReceiver [
	^ anExampleReceiver receiver 
		perform: anExample method selector 
		withArguments: anExampleReceiver arguments
]

{ #category : #private }
GtExampleEvaluator >> processAfter: anExample withDependencies: exampleDependencies andReceiver: anExampleReceiver [
	self processAfterMethodFor: anExample withReceiver: anExampleReceiver.
	exampleDependencies reversed do: [ :anotherExample |
		self processAfterMethodFor: anotherExample withReceiver: anExampleReceiver ]
]

{ #category : #private }
GtExampleEvaluator >> processAfterMethodFor: anExample withReceiver: anExampleReceiver [
	anExample after ifNil: [ ^ self ].
	anExample after method
		valueWithReceiver: anExampleReceiver receiver
		arguments: #()
]

{ #category : #public }
GtExampleEvaluator >> result [
	self do: [ result := self value ] 
		on: GtExampleResult signalableExceptions
		do: [ :anException |
			anException freeze. 
			result := (self newResultFor: self example) 
				returnValue: nil;
				exampleException: anException ].
	^ result
]
