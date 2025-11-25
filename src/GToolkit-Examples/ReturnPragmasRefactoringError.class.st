Class {
	#name : #ReturnPragmasRefactoringError,
	#superclass : #Error,
	#instVars : [
		'failingExample'
	],
	#category : 'GToolkit-Examples-Exceptions'
}

{ #category : #exceptioninstantiator }
ReturnPragmasRefactoringError class >> signal: aString failingExample: aGtExampleMethod [
	^ self new
		messageText: aString;
		failingExample: aGtExampleMethod;
		signal
]

{ #category : #accessing }
ReturnPragmasRefactoringError >> failingExample [
	^ failingExample
]

{ #category : #accessing }
ReturnPragmasRefactoringError >> failingExample: anObject [
	failingExample := anObject
]

{ #category : #'as yet unclassified' }
ReturnPragmasRefactoringError >> gtFailingGtExampleMethodFor: aView [
	<gtView>
	<gtExceptionView>
	<gtEmbeddedDebuggerView>
	self gtHasStack ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Failing example';
		priority: 0;
		object: [ self failingExample ];
		view: #gtSourceCodeFor:
]
