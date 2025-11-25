Class {
	#name : #GtExamplesReportRunPackageSignal,
	#superclass : #GtExamplesReportSignal,
	#instVars : [
		'packageName',
		'amountOfExampleClasses',
		'amountOfExamples'
	],
	#category : 'GToolkit-Examples-Testing'
}

{ #category : #accessing }
GtExamplesReportRunPackageSignal >> amountOfExampleClasses [
	^ amountOfExampleClasses
]

{ #category : #accessing }
GtExamplesReportRunPackageSignal >> amountOfExampleClasses: anObject [
	amountOfExampleClasses := anObject
]

{ #category : #accessing }
GtExamplesReportRunPackageSignal >> amountOfExamples [
	^ amountOfExamples
]

{ #category : #accessing }
GtExamplesReportRunPackageSignal >> amountOfExamples: anObject [
	amountOfExamples := anObject
]

{ #category : #accessing }
GtExamplesReportRunPackageSignal >> packageName [
	^ packageName
]

{ #category : #accessing }
GtExamplesReportRunPackageSignal >> packageName: anObject [
	packageName := anObject
]

{ #category : #printing }
GtExamplesReportRunPackageSignal >> printOneLineContentsOn: aStream [		
	aStream
		nextPutAll: 'Run ';
		print: self amountOfExampleClasses;
		nextPutAll: ' example classes (total ';
		print: self amountOfExamples;
		nextPutAll: ' examples) in ';
		print: self packageName;
		nextPutAll: ' package'
]
