Class {
	#name : #GtExamplesForExecutionEnvironment,
	#superclass : #Object,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #'examples - setup' }
GtExamplesForExecutionEnvironment >> exampleWithFailingBackgroundProcess [
	<gtExample>
	<noTest>
	
	[ 1/0 ] fork.
	
	self assert: true.
]

{ #category : #'examples - setup' }
GtExamplesForExecutionEnvironment >> exampleWithFailingBackgroundProcessInNestedProcess [
	<gtExample>
	<noTest>
	
	[ [ 1/0 ] 
		forkAt: Processor userSchedulingPriority + 10 ] 
			forkAt: Processor userSchedulingPriority + 10.
	
	self assert: true.
]

{ #category : #'examples - setup' }
GtExamplesForExecutionEnvironment >> exampleWithOneSecondTimeout [
	<gtExample>
	<timeLimit: 1000>
	<noTest>
	
	5 seconds wait.
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
