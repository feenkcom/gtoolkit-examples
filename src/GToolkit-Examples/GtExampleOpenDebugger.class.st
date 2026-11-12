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
	"Debug the example in a managed run (as in tests): it is cleaned up when it ends"

	^ self resultOpeningDebuggerOn: [ super result ]
]

{ #category : #private }
GtExampleOpenDebugger >> resultOpeningDebuggerOn: aResultBlock [
	"Evaluate aResultBlock in a new process opened in a debugger at the beginning of the example method.
	aResultBlock answers the example result (a managed or unmanaged run, see #result and #unmanagedResult);
	the callback receives it when the debugged process ends"

	| aCompiledMethod aProcess aContext aDebugSession |
	aCompiledMethod := self example method.

	aProcess := [ | anExampleResult |
		anExampleResult := aResultBlock value.
		self callbackWithResult: anExampleResult ] newProcess.
	aContext := aProcess suspendedContext.

	aDebugSession := aProcess newDebugSessionNamed: 'debug it' startedAt: aContext.	"Unclear why this is needed. Since Pharo 12 doing stepInto
	through GtExampleEvaluator>>#dependenciesFor: seems to kill the UI process"
	aDebugSession
		stepIntoUntil: [ :currentContext | 
			currentContext method == aCompiledMethod
				or: [ currentContext method == (GtExampleEvaluator >> #basicProcess:) ] ].
	aDebugSession stepOver.
	aDebugSession stepOver.
	aDebugSession stepOver.

	aDebugSession
		stepIntoUntil: [ :currentContext | currentContext method == aCompiledMethod ].

	self openDebuggerOnSession: aDebugSession.

	^ self newResultFor: self example
]

{ #category : #primitives }
GtExampleOpenDebugger >> unmanagedResult [
	"Debug the example without the clean up of managed runs, so that promises and processes
	it started keep running while the user works with the returned object (see GtExampleEvaluator>>#unmanagedResult)"

	^ self resultOpeningDebuggerOn: [ super unmanagedResult ]
]
