Class {
	#name : #GtToolkitExamplesTests,
	#superclass : #GtExampleTestCase,
	#category : #'GToolkit-Tests-Examples-SUnit'
}

{ #category : #running }
GtToolkitExamplesTests >> setUp [
	super setUp.
]

{ #category : #running }
GtToolkitExamplesTests >> tearDown [
	super tearDown.
]

{ #category : #tests }
GtToolkitExamplesTests >> testAllExamples [
	self timeLimit: 15 minutes.
	self runExampleContainers: (self packages: { 'GToolkit-*' })
]
