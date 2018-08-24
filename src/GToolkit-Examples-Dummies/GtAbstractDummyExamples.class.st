Class {
	#name : #GtAbstractDummyExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #testing }
GtAbstractDummyExamples class >> isAbstract [
	^ self == GtAbstractDummyExamples 
]

{ #category : #testing }
GtAbstractDummyExamples class >> isExpectedFailure [
	^ false
]

{ #category : #testing }
GtAbstractDummyExamples class >> isExpectedRecursion [
	^ false
]

{ #category : #asserting }
GtAbstractDummyExamples class >> should: aBlock raise: anExceptionalEvent [ 
	^self assert: (
		[aBlock value.
 		false] on: anExceptionalEvent
			do: [:ex | ex return: true])
			
]
