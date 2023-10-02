Class {
	#name : #GtExamplesReportResult,
	#superclass : #Object,
	#instVars : [
		'exampleResults',
		'runtimeStatisticsDiffReport'
	],
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #accessing }
GtExamplesReportResult >> exampleResults [
	^ exampleResults
]

{ #category : #accessing }
GtExamplesReportResult >> exampleResults: aCollection [
	exampleResults := aCollection
]

{ #category : #accessing }
GtExamplesReportResult >> runtimeStatisticsDiffReport [
	^ runtimeStatisticsDiffReport
]

{ #category : #accessing }
GtExamplesReportResult >> runtimeStatisticsDiffReport: aDiffReport [
	runtimeStatisticsDiffReport := aDiffReport
]
