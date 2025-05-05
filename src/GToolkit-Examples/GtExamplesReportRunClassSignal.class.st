Class {
	#name : #GtExamplesReportRunClassSignal,
	#superclass : #GtExamplesReportSignal,
	#instVars : [
		'exampleClass',
		'amountOfExamples'
	],
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #accessing }
GtExamplesReportRunClassSignal >> amountOfExamples [
	^ amountOfExamples
]

{ #category : #accessing }
GtExamplesReportRunClassSignal >> amountOfExamples: anObject [
	amountOfExamples := anObject
]

{ #category : #accessing }
GtExamplesReportRunClassSignal >> exampleClass [
	^ exampleClass
]

{ #category : #accessing }
GtExamplesReportRunClassSignal >> exampleClass: anObject [
	exampleClass := anObject
]

{ #category : #printing }
GtExamplesReportRunClassSignal >> printOneLineContentsOn: aStream [		
	aStream
		nextPutAll: 'Run ';
		print: self amountOfExamples;
		nextPutAll: ' examples in ';
		nextPutAll: self exampleClass name
]
