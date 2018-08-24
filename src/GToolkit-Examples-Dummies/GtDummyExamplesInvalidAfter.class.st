Class {
	#name : #GtDummyExamplesInvalidAfter,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesInvalidAfter class >> f [
	<gtExample>
	<label: 'Dummy #f'>
	<description: 'non existing after method'>
	<after: #afterF> " ! "
	<noTest>
	
]

{ #category : #examples }
GtDummyExamplesInvalidAfter class >> g [
	<gtExample>
	<label: 'Dummy #f'>
	<description: 'non existing after method'>
	<after: nil>
	<noTest>
	
]

{ #category : #testing }
GtDummyExamplesInvalidAfter class >> isExpectedFailure [
	^ true
]
