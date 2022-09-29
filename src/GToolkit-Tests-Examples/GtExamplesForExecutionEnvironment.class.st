Class {
	#name : #GtExamplesForExecutionEnvironment,
	#superclass : #Object,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #'examples - setup' }
GtExamplesForExecutionEnvironment >> exampleWithFailingBackgroundProcess [
	"This example is a noTest as it is designed to fail"
	<gtExample>
	<noTest>
	
	[ 1/0 ] fork.
	
	self assert: true.
]

{ #category : #'examples - setup' }
GtExamplesForExecutionEnvironment >> exampleWithFailingBackgroundProcessInNestedProcess [
	"This example is a noTest as it is designed to fail"
	<gtExample>
	<noTest>
	
	[ [ 1/0 ] 
		forkAt: Processor userSchedulingPriority + 10 ] 
			forkAt: Processor userSchedulingPriority + 10.
	
	self assert: true.
]

{ #category : #'examples - setup' }
GtExamplesForExecutionEnvironment >> exampleWithOneSecondTimeout [
	"This example is a noTest as it is designed to fail"
	<gtExample>
	<timeLimit: 1000>
	<noTest>
	
	5 seconds wait.
	self assert: true.
]

{ #category : #'examples - setup' }
GtExamplesForExecutionEnvironment >> exampleWithTwoFailingBackgroundProcess [
	"This example is a noTest as it is designed to fail"
	<gtExample>
	<noTest>
	
	[ 1/0 ] fork.
	[ 2/0 ] fork.
	
	self assert: true.
]

{ #category : #'examples - execution' }
GtExamplesForExecutionEnvironment >> runExampleWithFailingBackgroundProcess [
	<gtExample>
	<noTest>
	| targetExample result |	
	
	targetExample := (self class >> #exampleWithFailingBackgroundProcess) gtExample.
	result := targetExample run.
	
	self assert: result isError.
	self 
		assert: result returnValue class 
		equals: TestFailedByForkedProcess.
	
	^ result
]

{ #category : #'examples - execution' }
GtExamplesForExecutionEnvironment >> runExampleWithFailingBackgroundProcessInDebugMode [
	<gtExample>
	<noTest>
	| targetExample result failures |	
	
	targetExample := (self class >> #exampleWithFailingBackgroundProcess) gtExample.
	[ result := targetExample debug ] 
	 	on: TestFailedByForkedProcess 
	 	do: [ :ex |
	 		failures := ex executionEnvironment failures copy ].
	
	self assert: failures size equals: 1.
	self assert: failures values first exception class equals: ZeroDivide.
	
	^ failures
]

{ #category : #'examples - execution' }
GtExamplesForExecutionEnvironment >> runExampleWithFailingBackgroundProcessInNestedProcess [
	<gtExample>
	<noTest>
	| targetExample result |	
	
	targetExample := (self class >> #exampleWithFailingBackgroundProcessInNestedProcess) gtExample.
	result := targetExample run.
	
	self assert: result isError.
	self 
		assert: result returnValue class 
		equals: TestFailedByForkedProcess.
	
	^ result
]

{ #category : #'examples - execution' }
GtExamplesForExecutionEnvironment >> runExampleWithOneSecondTimeout [
	<gtExample>
	<noTest>
	| targetExample result |	
	
	targetExample := (self class >> #exampleWithOneSecondTimeout) gtExample.
	result := targetExample run.
	
	self assert: result isError.
	self 
		assert: result returnValue class 
		equals: TestTookTooMuchTime.
	
	^ result
]

{ #category : #'examples - execution' }
GtExamplesForExecutionEnvironment >> runExampleWithTwoFailingBackgroundProcess [
	<gtExample>
	<noTest>
	| targetExample result exception |	
	
	targetExample := (self class >> #exampleWithTwoFailingBackgroundProcess) gtExample.
	result := targetExample run.
	
	self assert: result isError.
	
	exception := result returnValue.
	self 
		assert: exception class 
		equals: TestFailedByForkedProcess.
	
	^ result
]

{ #category : #'examples - execution' }
GtExamplesForExecutionEnvironment >> runExampleWithTwoFailingBackgroundProcessInDebugMode [
	<gtExample>
	<noTest>
	| targetExample result failures |	
	
	targetExample := (self class >> #exampleWithTwoFailingBackgroundProcess) gtExample.
	[ result := targetExample debug ] 
	 	on: TestFailedByForkedProcess 
	 	do: [ :ex |
	 		failures := ex executionEnvironment failures copy ].
	
	self assert: failures size equals: 2.
	self assert: failures values first exception class equals: ZeroDivide.
	self assert: failures values second exception class equals: ZeroDivide.
	
	^ failures
]
