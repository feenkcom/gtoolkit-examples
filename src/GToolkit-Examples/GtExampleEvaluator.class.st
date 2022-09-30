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
	<return: #GtExampleResult>
	| currentResult anEvaluationContext dependencies |
	context example: anExample.

	dependencies := self dependenciesFor: anExample.
	currentResult := self newResultFor: anExample.
	anEvaluationContext := anExample evaluationContext.
	
	[ currentResult successValue: (self primitiveProcessExample: anExample withEvaluationContext: anEvaluationContext) ] 
		ensure: [ 
			self processAfter: anExample withDependencies: dependencies andEvaluationContext: anEvaluationContext ].
	
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
		context: self context
]

{ #category : #primitives }
GtExampleEvaluator >> primitiveProcessExample: anExample withEvaluationContext: anEvaluationContext [
	"Perform an example using a provider context and return its result"
	^ anEvaluationContext provider 
		perform: anExample method selector 
		withArguments: anEvaluationContext arguments
]

{ #category : #private }
GtExampleEvaluator >> processAfter: anExample withDependencies: exampleDependencies andEvaluationContext: anEvaluationContext [
	self processAfterMethodFor: anExample withEvaluationContext: anEvaluationContext.
	exampleDependencies reversed do: [ :anotherExample |
		self processAfterMethodFor: anotherExample withEvaluationContext: anEvaluationContext ]
]

{ #category : #private }
GtExampleEvaluator >> processAfterMethodFor: anExample withEvaluationContext: anEvaluationContext [
	anExample after ifNil: [ ^ self ].
	anEvaluationContext provider
		perform: anExample after method selector 
		withArguments: #()
]

{ #category : #public }
GtExampleEvaluator >> result [
	<return: #GtExampleResult>
	self  
		do: [ result := self runUnmanaged ] 
		on: GtExampleResult signalableExceptions
		do: [ :anException |
			anException freeze. 
			result := (self newResultFor: self example) 
				exampleException: anException ].
	^ result
]

{ #category : #public }
GtExampleEvaluator >> runManaged [
	<return: #GtExampleResult>
	^ CurrentExecutionEnvironment runExampleEvaluator: self
]

{ #category : #public }
GtExampleEvaluator >> runUnmanaged [
	<return: #GtExampleResult>
	^ self value
]

{ #category : #accessing }
GtExampleEvaluator >> timeLimit [
	^  example timeLimit
]
