Class {
	#name : #GtExampleExecutionEnvironment,
	#superclass : #Object,
	#category : #'GToolkit-Tests-Examples'
}

{ #category : #testing }
GtExampleExecutionEnvironment >> testExecutionEnvironmentIsActive [
	<gtExample>
	
	self assert: CurrentExecutionEnvironment value isTest.
	
	self 
		assert: CurrentExecutionEnvironment value testCase context
		equals: self gtExampleRuntimeContext .
		
	self 
		assert: CurrentExecutionEnvironment value testCase example
		equals: (self class >> #testExecutionEnvironmentIsActive) gtExample.
		
	self 
		assert: CurrentExecutionEnvironment value hasCompletedTest not .
		
	^ CurrentExecutionEnvironment value
]

{ #category : #testing }
GtExampleExecutionEnvironment >> testExplicitlyRunningTestSetsTheExecutionEnvironment [
	<gtExample>
	| targetExample result|
	
	targetExample :=(self class >> #testExecutionEnvironmentIsActive) gtExample.
	result := targetExample run.
	
	self assert: result isSuccess.
	self assert: result returnValue hasCompletedTest.
	
	^ result
]
