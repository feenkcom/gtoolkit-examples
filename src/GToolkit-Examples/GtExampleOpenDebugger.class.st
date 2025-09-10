Class {
	#name : #GtExampleOpenDebugger,
	#superclass : #GtExampleEvaluator,
	#instVars : [
		'resultCallback',
		'openDebuggerCallback'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #accessing }
GtExampleOpenDebugger >> callback [
	^ resultCallback
]

{ #category : #accessing }
GtExampleOpenDebugger >> callback: aValuable [
	resultCallback := aValuable
]

{ #category : #private }
GtExampleOpenDebugger >> callbackWithResult: anExampleResult [
	self callback cull: anExampleResult
]

{ #category : #private }
GtExampleOpenDebugger >> do: aBlock on: anException do: anotherBlock [
	aBlock value
]

{ #category : #initialization }
GtExampleOpenDebugger >> initialize [
	super initialize.
	resultCallback := [ :anExampleResult | "do nothing" ].
	
	openDebuggerCallback := [ :aDebugSession | 
		 Smalltalk tools debugger 
			openOn: aDebugSession 
			withFullView: true. ]
]

{ #category : #'as yet unclassified' }
GtExampleOpenDebugger >> openDebuggerCallback: aBlockClosure [ 
	openDebuggerCallback := aBlockClosure
]

{ #category : #primitives }
GtExampleOpenDebugger >> openDebuggerOnSession: aDebugSession [ 
	^ openDebuggerCallback cull: aDebugSession
]

{ #category : #primitives }
GtExampleOpenDebugger >> result [
	| aCompiledMethod aProcess aContext aDebugSession |
	aCompiledMethod := self example method.
	
	aProcess := [ 
		| anExampleResult |
		anExampleResult := super result.
		self callbackWithResult: anExampleResult ] newProcess.
	aContext := aProcess suspendedContext.
	
	aDebugSession := aProcess newDebugSessionNamed: 'debug it' startedAt: aContext.
	
	self 
		forPharo12AndNewer: [ 
			"Unclear why this is needed. Currently in Pharo 12 doing stepInto
			through GtExampleEvaluator>>#dependenciesFor: seems to kill the UI process"
			aDebugSession stepIntoUntil: [ :currentContext | 
				currentContext method == aCompiledMethod or: [
					currentContext method == (GtExampleEvaluator>>#basicProcess: )] ].
			aDebugSession stepOver.
			aDebugSession stepOver.
			aDebugSession stepOver] 
	forPharo11: [].
	
	aDebugSession stepIntoUntil: [ :currentContext | 
		currentContext method == aCompiledMethod ].
	
	self openDebuggerOnSession: aDebugSession.
	
	^ self newResultFor: self example.
]
