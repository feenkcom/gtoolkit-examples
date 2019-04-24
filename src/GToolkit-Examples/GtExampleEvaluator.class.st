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
	| currentResult providerValue dependencies |
	context example: anExample.

	dependencies := self dependenciesFor: anExample.
	currentResult := self newResultFor: anExample.
	providerValue := anExample providerValue.
	
	[ currentResult returnValue: (self primitiveProcessExample: anExample withProviderValue: providerValue) ] 
		ensure: [ 
			self processAfter: anExample withDependencies: dependencies andProviderValue: providerValue ].
	
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
GtExampleEvaluator >> primitiveProcessExample: anExample withProviderValue: aProviderValue [
	"Perform an example using a provider context and return its result"
	^ aProviderValue performExample: anExample
]

{ #category : #private }
GtExampleEvaluator >> processAfter: anExample withDependencies: exampleDependencies andProviderValue: aProviderValue [
	self processAfterMethodFor: anExample withProviderContext: aProviderValue.
	exampleDependencies reversed do: [ :anotherExample |
		self processAfterMethodFor: anotherExample withProviderContext: aProviderValue ]
]

{ #category : #private }
GtExampleEvaluator >> processAfterMethodFor: anExample withProviderContext: aProviderValue [
	anExample after ifNil: [ ^ self ].
	aProviderValue performAfterMethodForExample: anExample.
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
