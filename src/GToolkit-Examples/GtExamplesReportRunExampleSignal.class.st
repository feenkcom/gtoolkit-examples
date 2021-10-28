Class {
	#name : #GtExamplesReportRunExampleSignal,
	#superclass : #GtExamplesReportSignal,
	#instVars : [
		'example'
	],
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #accessing }
GtExamplesReportRunExampleSignal >> example [
	^ example
]

{ #category : #accessing }
GtExamplesReportRunExampleSignal >> example: anObject [
	example := anObject
]

{ #category : #printing }
GtExamplesReportRunExampleSignal >> printOneLineOn: aStream [		
	aStream tab.
	self example printClassLabelOn: aStream.
	aStream
		nextPutAll: ' >> ';
		print: self example selector
]
