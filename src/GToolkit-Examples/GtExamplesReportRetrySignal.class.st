Class {
	#name : #GtExamplesReportRetrySignal,
	#superclass : #GtExamplesReportSignal,
	#instVars : [
		'example',
		'retryCount'
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

{ #category : #accessing }
GtExamplesReportRetrySignal >> printOneLineContentsOn: stream [

	stream
		print: example;
		<< ': ';
		print: retryCount.
]

{ #category : #accessing }
GtExamplesReportRetrySignal >> retryCount [
	^ retryCount
]

{ #category : #accessing }
GtExamplesReportRetrySignal >> retryCount: anObject [
	retryCount := anObject
]
