Class {
	#name : #GtExampleOpenDebugger,
	#superclass : #GtExampleEvaluator,
	#instVars : [
		'callback'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #accessing }
GtExampleOpenDebugger >> basicProcess: anExample [
	<return: #GtExampleResult>
	| currentResult anEvaluationContext |

	context example: anExample.

	currentResult := self newResultFor: anExample.
	anEvaluationContext := anExample evaluationContext.
	
	currentResult successValue: (self primitiveProcessExample: anExample withEvaluationContext: anEvaluationContext).
	
	^ currentResult
]

{ #category : #accessing }
GtExampleOpenDebugger >> callback [
	^ callback
]

{ #category : #accessing }
GtExampleOpenDebugger >> callback: aValuable [
	callback := aValuable
]

{ #category : #private }
GtExampleOpenDebugger >> callbackWithExample: anExample result: anObject [
	| anExampleResult |
	anExampleResult := self newResultFor: self example.
	anExampleResult successValue: anObject.
	self callback cull: anExampleResult
]

{ #category : #private }
GtExampleOpenDebugger >> do: aBlock on: anException do: anotherBlock [
	aBlock value
]

{ #category : #initialization }
GtExampleOpenDebugger >> initialize [
	super initialize.
	callback := [ :anExampleResult | "do nothing" ]
]

{ #category : #primitives }
GtExampleOpenDebugger >> result [
	| aCompiledMethod aProcess aContext aDebugSession |
	aCompiledMethod := self example method.
	
	aProcess := [ 
		| aValue |
		aValue := super result.
		self callbackWithExample: self example result: aValue ] newProcess.
	aContext := aProcess suspendedContext.
	
	aDebugSession := aProcess newDebugSessionNamed: 'debug it' startedAt: aContext.
	aDebugSession stepIntoUntil: [ :currentContext | 
		currentContext method == aCompiledMethod ].
	
	Smalltalk tools debugger openOn: aDebugSession withFullView: true.
	
	^ self newResultFor: self example.
]
