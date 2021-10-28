"
I encalsulate a method that needs to be executed after an example was run. I provide similar, but not identical functionality, with the tearDown method from SUnit. 


"
Class {
	#name : #GtExampleMethodAfter,
	#superclass : #GtAbstractExampleMethod,
	#category : 'GToolkit-Examples-Organization'
}

{ #category : #testing }
GtExampleMethodAfter >> exists [
	^ self methodClassName notNil
		and: [ self methodClass notNil
			and: [ (self methodClass whichClassIncludesSelector: self selector) notNil ] ]
]

{ #category : #'accessing-dynamic' }
GtExampleMethodAfter >> method [
	^ self exists 
		ifTrue: [
			(self methodClass whichClassIncludesSelector: self selector)
				ifNotNil: [ :aMethodClass | aMethodClass >> self selector ] ]
		ifFalse: [ nil ]
]
