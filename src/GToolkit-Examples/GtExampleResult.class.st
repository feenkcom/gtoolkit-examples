"
I represent the result of executing an example. 

I can be in the following four states:
- success: creating and runnign the example executed successfully;
- failure: running the examples caused an assertion to fail, either in the actul example or in an after method;
- error: running the example raised an exception that makes the example be considered an error, either in the actul example of in an after method;
- problem: creating the example  detected issues in the structure of the example; the example will still be run, however, it will have a distinct state regardless of the result of the run.

API for determining the state of the example:
- {{gtMethod:GtExampleResult class>>#failure}} is the exception that marks this example as a failure. This is also the exception raised when an assertion fails within an example;
- {{gtMethod:GtExampleResult class>>#signalableExceptions}} provides a list of exception that mark the example as an error (only if the example is not already a failure).

I keep track of the
- returnValue: the real object returned by the example method
- exception: the last error executed during an example

"
Class {
	#name : #GtExampleResult,
	#superclass : #Object,
	#instVars : [
		'example',
		'context',
		'returnValue'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #exceptions }
GtExampleResult class >> failure [
	^ AssertionFailure
]

{ #category : #accessing }
GtExampleResult class >> leJsonV4AttributeMapping [ 

	^ { 
		#exampleSton -> #example.
		"#context -> #context."
		#basicReturnValue -> #returnValue.
		}
]

{ #category : #accessing }
GtExampleResult class >> leJsonV4Name [

	^ #gtExampleResult
]

{ #category : #exceptions }
GtExampleResult class >> signalableExceptions [
	"I return the set of exceptions that are captured by the evaluator and cause an example to fail."
	^ ExceptionSet new ,
		Halt ,
		Error ,
		TestFailure",
		Deprecation"
]

{ #category : #'private - serialization' }
GtExampleResult >> basicReturnValue [
	"Answer the returnValue object for serialization"

	^ returnValue
]

{ #category : #'private - serialization' }
GtExampleResult >> basicReturnValue: aReturnValue [
	"Set the returnValue object for serialization"

	returnValue := aReturnValue
]

{ #category : #ui }
GtExampleResult >> color [

	<return: #Color>
	^ returnValue color
]

{ #category : #accessing }
GtExampleResult >> context [
	^ context
]

{ #category : #accessing }
GtExampleResult >> context: anObject [
	context := anObject
]

{ #category : #actions }
GtExampleResult >> debug [
	self isSuccess ifTrue: [ ^ self ].
	^ self example debug
]

{ #category : #accessing }
GtExampleResult >> example [
	^ example
]

{ #category : #accessing }
GtExampleResult >> example: anObject [
	example := anObject
]

{ #category : #accessing }
GtExampleResult >> exampleException: anException [

	anException isGtExampleFailure
		ifTrue: [ 
			self returnValue:
				(GtExampleResultFailureValue new failure: anException) ]
		ifFalse: [ 
			self returnValue:
				(GtExampleResultErrorValue new exception: anException) ]
]

{ #category : #'private - serialization' }
GtExampleResult >> exampleSton [

	^ STON toString: example
]

{ #category : #'private - serialization' }
GtExampleResult >> exampleSton: aString [

	example := STON fromString: aString.

]

{ #category : #ui }
GtExampleResult >> gtDisplayOn: aStream [

	self example gtDisplayOn: aStream.

	returnValue ifNotNil: [ 
		aStream nextPutAll: ' ['.
		self returnValue gtDisplayOn: aStream.
		aStream nextPutAll: ']' ]
]

{ #category : #ui }
GtExampleResult >> gtDisplayValidityOn: aStream [

	self isSuccess ifTrue: [ ^ self ].

	aStream nextPutAll: ' ['.
	self returnValue gtDisplayOn: aStream.
	aStream nextPutAll: ']'
]

{ #category : #ui }
GtExampleResult >> gtLiveFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Return value';
		priority: 10;
		object: [ returnValue ];
		view: #gtLiveFor:
]

{ #category : #testing }
GtExampleResult >> hasException [

	^ self isFailure or: [ self isError ]
]

{ #category : #testing }
GtExampleResult >> hasProblems [
	^ self example hasProblems
		or: [ self hasException ]
]

{ #category : #ui }
GtExampleResult >> icon [

	<return: #Form>
	^ returnValue iconForm
]

{ #category : #initialization }
GtExampleResult >> initialize [

	super initialize.

	returnValue := GtExampleResultNoValue uniqueInstance
]

{ #category : #testing }
GtExampleResult >> isError [

	^ returnValue isError
]

{ #category : #testing }
GtExampleResult >> isFailure [

	^ returnValue isFailure
]

{ #category : #testing }
GtExampleResult >> isSuccess [

	^ returnValue isSuccess and: [ self example hasProblems not ]
]

{ #category : #actions }
GtExampleResult >> openDebugger [
	^ self example openDebugger
]

{ #category : #ui }
GtExampleResult >> printOn: aStream [

	self example printOn: aStream.

	returnValue ifNotNil: [ 
		aStream nextPutAll: ' ['.
		self returnValue printOn: aStream.
		aStream nextPutAll: ']' ]
]

{ #category : #accessing }
GtExampleResult >> returnInstance [

	<return: #TGtExampleResultValue>
	^ returnValue
]

{ #category : #accessing }
GtExampleResult >> returnValue [

	"Return an example execution result value, e.g., success value or exception"

	^ returnValue value
]

{ #category : #accessing }
GtExampleResult >> returnValue: aGtExampleResultValue [

	returnValue := aGtExampleResultValue
]

{ #category : #accessing }
GtExampleResult >> returnValueOrExampleException [

	self
		deprecated: 'Please use #returnValue instead.'
		transformWith:
		'`@receiver returnValueOrExampleException'
		-> '`@receiver returnValue'.

	^ self returnValue
]

{ #category : #actions }
GtExampleResult >> run [
	^ self example run
]

{ #category : #accessing }
GtExampleResult >> successValue: anObject [

	self returnValue: (GtExampleResultSuccessValue new value: anObject)
]
