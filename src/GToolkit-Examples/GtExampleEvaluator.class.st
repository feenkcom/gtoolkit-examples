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
	| currentResult providerContext dependencies |
	context example: anExample.

	dependencies := self dependenciesFor: anExample.
	currentResult := self newResultFor: anExample.
	providerContext := anExample providerContext.
	
	[ currentResult returnValue: (self primitiveProcessExample: anExample withProviderContext: providerContext) ] 
		ensure: [ 
			self processAfter: anExample withDependencies: dependencies andProviderContext: providerContext ].
	
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
GtExampleEvaluator >> primitiveProcessExample: anExample withProviderContext: aProviderContext [
	"Perform an example using a provider context and return its result"
	^ aProviderContext performExample: anExample
]

{ #category : #private }
GtExampleEvaluator >> processAfter: anExample withDependencies: exampleDependencies andProviderContext: aProviderContext [
	self processAfterMethodFor: anExample withProviderContext: aProviderContext.
	exampleDependencies reversed do: [ :anotherExample |
		self processAfterMethodFor: anotherExample withProviderContext: aProviderContext ]
]

{ #category : #private }
GtExampleEvaluator >> processAfterMethodFor: anExample withProviderContext: aProviderContext [
	anExample after ifNil: [ ^ self ].
	aProviderContext performAfterMethodForExample: anExample.
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
