Class {
	#name : #GtToolkitExamplesTests,
	#superclass : #GtExampleTestCase,
	#category : 'GToolkit-Tests-Examples-SUnit'
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
GtToolkitExamplesTests >> testExamplesDebugger [
	self runExampleContainers: (self packages: { 'GT-Debugger*' })
]

{ #category : #tests }
GtToolkitExamplesTests >> testExamplesInspector [
	self runExampleContainers: (self packages: { 'GT-Inspector*' })
]

{ #category : #tests }
GtToolkitExamplesTests >> testExamplesPlayground [
	self runExampleContainers: (self packages: { 'GT-Playground*' })
]

{ #category : #tests }
GtToolkitExamplesTests >> testExamplesSpotter [
	self runExampleContainers: (self packages: { 'GT-Spotter*' })
]
