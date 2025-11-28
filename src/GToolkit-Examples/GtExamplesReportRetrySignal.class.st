Class {
	#name : #GtExamplesReportRetrySignal,
	#superclass : #GtExamplesReportSignal,
	#instVars : [
		'example',
		'retryCount',
		'exception'
	],
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #accessing }
GtExamplesReportRetrySignal >> example [
	^ example
]

{ #category : #accessing }
GtExamplesReportRetrySignal >> example: anObject [
	example := anObject
]

{ #category : #running }
GtExamplesReportRetrySignal >> exception: anException [
	exception := anException 
]

{ #category : #accessing }
GtExamplesReportRetrySignal >> printOneLineContentsOn: stream [

	stream
		<< example gtDisplayString;
		<< ': ';
		print: retryCount.
	exception ifNotNil: [
		stream 
			<< '; exception: ';
			<< (exception messageText ifNil: [ '<no message>' ]) ]
]

{ #category : #accessing }
GtExamplesReportRetrySignal >> retryCount [
	^ retryCount
]

{ #category : #accessing }
GtExamplesReportRetrySignal >> retryCount: anObject [
	retryCount := anObject
]
