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
GtExampleOpenDebugger >> primitiveProcessExample: anExample withEvaluationContext: anEvaluationContext [
	| aCompiledMethod aProcess aContext aDebugSession |
	aCompiledMethod := anExample method.
	aProcess := [ 
		| aValue |
		[ aValue := anEvaluationContext provider 
			perform: anExample method selector 
			withArguments: anEvaluationContext arguments ] ensure: 
					[ self processAfter: anExample 
						withDependencies: (self dependenciesFor:  anExample)
						andEvaluationContext: anEvaluationContext ].
		self callbackWithExample: anExample result: aValue ]
		newProcess.
	aContext := aProcess suspendedContext.
	
	aDebugSession := aProcess newDebugSessionNamed: 'debug it' startedAt: aContext.
	aDebugSession stepIntoUntil: [ :currentContext | 
		currentContext method == aCompiledMethod ].
	
	Smalltalk tools debugger openOn: aDebugSession withFullView: true.
]
