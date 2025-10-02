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
GtExampleExecutionEnvironment >> testExplicitlyRunningTestSetsTheExecutionEnvironment_newEnvironment [
	<gtExample>
	| targetExample result|
	
	targetExample :=(self class >> #testExecutionEnvironmentIsActive) gtExample.
	
	"Run the examples from within the exampke in its own testing environment"
	TestExecutionEnvironment new beActiveDuring: [
		result := targetExample run ]. 
	
	
	self assert: result isSuccess.
	self assert: result returnValue hasCompletedTest.
	
	^ result
]

{ #category : #testing }
GtExampleExecutionEnvironment >> testExplicitlyRunningTestSetsTheExecutionEnvironment_sameEnvironment [
	<gtExample>
	| targetExample result|
	
	targetExample :=(self class >> #testExecutionEnvironmentIsActive) gtExample.
	result := targetExample run.
	
	self assert: result isSuccess.
	self assert: result returnValue hasCompletedTest.
	
	^ result
]
