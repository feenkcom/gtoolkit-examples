"
I provide short and long running examples for GemStone timeout acceptance checks.
"
Class {
	#name : #GtDummyExampleWithTimeout,
	#superclass : #Object,
	#classVars : [
		'CleanupCount'
	],
	#category : #'GToolkit-Examples-Dummies'
}

{ #category : #accessing }
GtDummyExampleWithTimeout class >> cleanupCount [
	^ CleanupCount ifNil: [ 0 ]
]

{ #category : #accessing }
GtDummyExampleWithTimeout class >> resetCleanupCount [
	CleanupCount := 0
]

{ #category : #examples }
GtDummyExampleWithTimeout >> defaultLimitExample [
	<gtExample>
	^ true
]

{ #category : #examples }
GtDummyExampleWithTimeout >> fastExample [
	<gtExample>
	<timeLimit: 1000>
	^ true
]

{ #category : #private }
GtDummyExampleWithTimeout >> recordCleanup [
	CleanupCount := self class cleanupCount + 1
]

{ #category : #examples }
GtDummyExampleWithTimeout >> slowExample [
	<gtExample>
	<timeLimit: 100>
	<noTest>
	(Delay forMilliseconds: 300) wait.
	^ true
]

{ #category : #examples }
GtDummyExampleWithTimeout >> slowWithAfterExample [
	<gtExample>
	<timeLimit: 100>
	<after: #recordCleanup>
	<noTest>
	(Delay forMilliseconds: 300) wait.
	^ true
]
