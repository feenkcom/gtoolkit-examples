"
I provide examples for ==GtExample== instances that raise errors when the example is run.
"
Class {
	#name : #GtExamplesExamplesWithRuntimeErrors,
	#superclass : #GtExampleProvider,
	#category : 'GToolkit-Tests-Examples'
}

{ #category : #asserting }
GtExamplesExamplesWithRuntimeErrors >> assertDebuggingExample: anExample raises: anException [
	| result possibleResult |

	self assert: anExample isValid.
	possibleResult := Object new.
	result := possibleResult.
	self 
		should: [ result := anExample debug ] 
		raise: anException.
	self assert: result == possibleResult.
]

{ #category : #asserting }
GtExamplesExamplesWithRuntimeErrors >> assertExpectedErrorFor: anExampleResult ofClass: anErrorClass withMessage: anErrorMessage [
	
	self 
		assertExpectedExceltionFor: anExampleResult 
		ofClass: anErrorClass 
		withMessage: anErrorMessage.
	self assert: anExampleResult isFailure not.
	self assert: anExampleResult isError.
	
]

{ #category : #asserting }
GtExamplesExamplesWithRuntimeErrors >> assertExpectedExceltionFor: anExampleResult ofClass: anErrorClass withMessage: anErrorMessage [
	
	self assert: anExampleResult example hasProblems not description: 'No problem just an exception'.
	 
	self assert: anExampleResult hasProblems description: 'A result with an exception has problems'.
	self assert: anExampleResult hasException.
	self assert: anExampleResult isSuccess not.
	self assert: anExampleResult returnValue isNil.
	
	self assert: anExampleResult exampleException notNil.
	self assert: anExampleResult exampleException messageText equals: anErrorMessage.
	self assert: anExampleResult exampleException class equals: anErrorClass.
]

{ #category : #asserting }
GtExamplesExamplesWithRuntimeErrors >> assertExpectedFailureFor: anExampleResult [ 
	
	self 
		assertExpectedExceltionFor: anExampleResult 
		ofClass: AssertionFailure 
		withMessage: 'Assertion failed'.
	self assert: anExampleResult isFailure.
	self assert: anExampleResult isError not.
	
]

{ #category : #tests }
GtExamplesExamplesWithRuntimeErrors >> exampleRaisingAssertionFailedException [
	<gtExample>
	<subjectClass: #GtExample>
	| example |
	
	example := (GtDummyExamplesWithExceptions class >> #e) gtExample.
	self assertDebuggingExample: example raises: AssertionFailure.
	
	^ example
]

{ #category : #tests }
GtExamplesExamplesWithRuntimeErrors >> exampleRaisingMessageNotUnderstoodException [
	<gtExample>
	<subjectClass: #GtExample>
	| example |
	
	example := (GtDummyExamplesInvalidDependencies class >> #a) gtExample.
	self assertDebuggingExample: example raises: MessageNotUnderstood.
	
	^ example
]

{ #category : #tests }
GtExamplesExamplesWithRuntimeErrors >> exampleRaisingZeroDivideException [
	<gtExample>
	<subjectClass: #GtExample>
	| example |
	
	example := (GtDummyExamplesWithExceptions class >> #j) gtExample.
	self assertDebuggingExample: example raises: ZeroDivide.
	
	^ example
]

{ #category : #'examples - result' }
GtExamplesExamplesWithRuntimeErrors >> exampleResultWithAssertionFailedException [
	<gtExample>
	<subjectClass: #GtExampleResult>
	| result |
	
	result := self exampleRaisingAssertionFailedException run.
	self assertExpectedFailureFor: result.
	
	^ result
]

{ #category : #'examples - result' }
GtExamplesExamplesWithRuntimeErrors >> exampleResultWithMessageNotUnderstoodException [
	<gtExample>
	<subjectClass: #GtExampleResult>
	| result |
	
	result := self exampleRaisingMessageNotUnderstoodException run.
	self 
		assertExpectedErrorFor: result 
		ofClass: MessageNotUnderstood 
		withMessage: 'GtDummyExamplesInvalidDependencies class>>a1'.
	
	^ result
]

{ #category : #'examples - result' }
GtExamplesExamplesWithRuntimeErrors >> exampleResultWithZeroDivideException [
	<gtExample>
	<subjectClass: #GtExampleResult>
	| result |
	
	result := self exampleRaisingZeroDivideException run.
	self 
		assertExpectedErrorFor: result 
		ofClass: ZeroDivide 
		withMessage: ''.
	
	^ result
]
