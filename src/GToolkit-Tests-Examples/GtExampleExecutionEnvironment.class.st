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
		
	^ CurrentExecutionEnvironment value
]
