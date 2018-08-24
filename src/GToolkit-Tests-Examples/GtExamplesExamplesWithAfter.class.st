"
I provide examples for ==GtExample== instances that have an after method.
"
Class {
	#name : #GtExamplesExamplesWithAfter,
	#superclass : #GtExampleProvider,
	#category : 'GToolkit-Tests-Examples'
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
