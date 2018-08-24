Class {
	#name : #GtDummyExamplesOnInstanceSide,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> a [
	<gtExample>
	| fourtyTwo |
	
	fourtyTwo := self b + self c.
	self assert: fourtyTwo equals: 42.
	^ fourtyTwo
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> b [
	<gtExample>
	
	^ 38 + self c + self d
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> c [
	<gtExample>
	
	^ 1
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> d [
	<gtExample>
	
	^ self e
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> e [
	<gtExample>
	
	^ 2
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> return1A [
	<gtExample>
	^ 1
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> return1B [
	<gtExample>
	^ 1
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> return2 [
	<gtExample>
	"I call two compiled methods that should be equal (same implementation, but different selectors)"
	^ self return1A + self return1B
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> sameExampleCalledTwice [
	<gtExample>
	
	^ self e + self e 
]
