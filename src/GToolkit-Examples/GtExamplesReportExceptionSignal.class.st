Class {
	#name : #GtExamplesReportExceptionSignal,
	#superclass : #GtExamplesReportSignal,
	#instVars : [
		'error',
		'message'
	],
	#category : 'GToolkit-Examples-Testing'
}

{ #category : #accessing }
GtExamplesReportExceptionSignal >> error: theError [
	error := theError
]

{ #category : #accessing }
GtExamplesReportExceptionSignal >> message: aMessage [
	message := aMessage
]

{ #category : #accessing }
GtExamplesReportExceptionSignal >> printOneLineOn: aStream [		
	aStream
		nextPutAll: 'Error ';
		nextPutAll: message;
		print: error 
]
