"
I provide examples for `GtExample` instances that have an after method.


"
Class {
	#name : #GtExamplesExamplesWithAfter,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #asserting }
GtExamplesExamplesWithAfter >> assertExample: anExample hasAfterMethod: aCompiledMethod [

	self assert: anExample after notNil.
	self assert: anExample after exists.
	self assert: anExample after methodClassName equals: aCompiledMethod methodClass name.
	self assert: anExample after selector equals: aCompiledMethod selector.
	self assert: anExample after methodClass equals: aCompiledMethod methodClass.
	self assert: anExample after method equals: aCompiledMethod.
]

{ #category : #'examples - class side' }
GtExamplesExamplesWithAfter >> exampleClassSideWithAfterAndNoDependency [
	<gtExample>
	| example returnedContext |
	
	example := (GtDummyExamplesWithAfterClassSide class >> #c) gtExample.
	self assertExample: example hasAfterMethod: (GtDummyExamplesWithAfterClassSide class >> #afterC).
	
	returnedContext := example run returnValue.
	self assert: (returnedContext includesKey: #c) not.
	self assert: (returnedContext includesKey: #c2).
	self assert: (returnedContext at: #execution) equals: { #afterC } asOrderedCollection.
	
	^ example
]

{ #category : #'examples - class side' }
GtExamplesExamplesWithAfter >> exampleClassSideWithAfterAndNoDependency_openDebuggerAndProceed [
	"I am an example checking that after is called if we resume from the debugger."
	<gtExample>
	| example debuggerOpened returnedContext  fullDebugger scripter |
	
	example := (GtDummyExamplesWithAfterClassSide class >> #c) gtExampleWithResult.
	self assertExample: example hasAfterMethod: (GtDummyExamplesWithAfterClassSide class >> #afterC).
	
	returnedContext := nil.
	debuggerOpened := example openingDebugger.
	debuggerOpened
		callback: [ :anExampleResult |
			example result:  anExampleResult ];
		openDebuggerCallback: [ :aDebugSession | 
			fullDebugger := GtMoldableDebugger on: aDebugSession ].
	
	"This executed the example opening the debugger and setting the returned value in the example"
	debuggerOpened result returnValue.
	"We can get the returned value from the example"
	returnedContext := example returnValue.
	
	scripter := BlScripter new.
	scripter element:  fullDebugger.
	
	self stepOverContextSettingResultInDebugger: fullDebugger.
		
	scripter doStep: [ :aStep | 
		aStep
			label: 'Close Debugger';
			action: [ :aDebugger | 
				aDebugger currentDebugger resumeAndCloseDebugger ] ].
	
	self assert: returnedContext notNil.
	self assert: (returnedContext includesKey: #c) not.
	self assert: (returnedContext includesKey: #c2).
	self 
		assert: (returnedContext at: #execution) 
		equals: { #afterC } asOrderedCollection.
	
	^ example
]

{ #category : #'examples - class side' }
GtExamplesExamplesWithAfter >> exampleClassSideWithMultipleDependenciesWithAfter [
	<gtExample>
	| example returnedContext |
	
	example := (GtDummyExamplesWithAfterClassSide class >> #a) gtExample.
	self assertExample: example hasAfterMethod: (GtDummyExamplesWithAfterClassSide class >> #afterA).
	
	returnedContext := example run returnValue.
	self assert: (returnedContext includesKey: #a) not.
	self assert: (returnedContext includesKey: #a2).
	self assert: (returnedContext includesKey: #b) not.
	self assert: (returnedContext includesKey: #b2).
	self assert: (returnedContext includesKey: #c) not.
	self assert: (returnedContext includesKey: #c2).
	self assert: (returnedContext at: #execution) equals: { #afterA. #afterB. #afterC } asOrderedCollection.
	
	^ example
]

{ #category : #'examples - instance side' }
GtExamplesExamplesWithAfter >> exampleInstanceSideWithAfterAndNoDependency [
	<gtExample>
	| example returnedContext |
	
	example := (GtDummyExamplesWithAfterInstanceSide >> #c) gtExample.
	self assertExample: example hasAfterMethod: (GtDummyExamplesWithAfterInstanceSide >> #afterC).
	
	returnedContext := example run returnValue.
	self assert: (returnedContext includesKey: #c) not.
	self assert: (returnedContext includesKey: #c2).
	self assert: (returnedContext at: #execution) equals: { #afterC } asOrderedCollection.
	self assert: (returnedContext at: #self) afterExecution equals: { #afterC } asOrderedCollection.
	
	^ example
]

{ #category : #'examples - instance side' }
GtExamplesExamplesWithAfter >> exampleInstanceSideWithMultipleDependenciesWithAfter [
	<gtExample>
	| example returnedContext |
	
	example := (GtDummyExamplesWithAfterInstanceSide >> #a) gtExample.
	self assertExample: example hasAfterMethod: (GtDummyExamplesWithAfterInstanceSide >> #afterA).
	
	returnedContext := example run returnValue.
	self assert: (returnedContext includesKey: #a) not.
	self assert: (returnedContext includesKey: #a2).
	self assert: (returnedContext includesKey: #b) not.
	self assert: (returnedContext includesKey: #b2).
	self assert: (returnedContext includesKey: #c) not.
	self assert: (returnedContext includesKey: #c2).
	self assert: (returnedContext at: #execution) equals: { #afterA. #afterB. #afterC } asOrderedCollection.
	self assert: (returnedContext at: #self) afterExecution equals: { #afterA. #afterB. #afterC } asOrderedCollection.
	
	^ example
]

{ #category : #utils }
GtExamplesExamplesWithAfter >> stepOverContextSettingResultInDebugger: aFullDebugger [ 
	
	aFullDebugger currentDebugger  session stepOverUntil: [ :currentContext | 
		currentContext selector = #result and: [ 
			currentContext methodClass = GtExampleOpenDebugger ] ].
		
	aFullDebugger  currentDebugger  session
		stepOver;
		stepOver.
]
