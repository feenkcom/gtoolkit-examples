Class {
	#name : #GtExamplesFinalReleaseTest,
	#superclass : #TestCase,
	#category : 'GToolkit-Tests-Examples-SUnit'
}

{ #category : #running }
GtExamplesFinalReleaseTest >> setUp [
	super setUp.
	
	Smalltalk garbageCollect
]

{ #category : #running }
GtExamplesFinalReleaseTest >> tearDown [
	super tearDown.
	
	Smalltalk garbageCollect
]

{ #category : #tests }
GtExamplesFinalReleaseTest >> testNoExampleInstances [

	self assert: GtExample allSubInstances size equals: 0.
	self assert: GtExampleResult allSubInstances size equals: 0.
	
]
