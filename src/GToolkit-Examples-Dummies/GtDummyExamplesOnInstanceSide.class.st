Class {
	#name : #GtDummyExamplesOnInstanceSide,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> a [
	<gtExample>
	<return: #SmallInteger>
	| fourtyTwo |
	fourtyTwo := self b + self c.
	self assert: fourtyTwo equals: 42.
	^ fourtyTwo
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> b [
	<gtExample>
	<return: #SmallInteger>
	^ 38 + self c + self d
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> c [
	<gtExample>
	<return: #SmallInteger>
	^ 1
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> d [
	<gtExample>
	<return: #SmallInteger>
	^ self e
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> e [
	<gtExample>
	<return: #SmallInteger>
	^ 2
]

{ #category : #accessing }
GtDummyExamplesOnInstanceSide >> exampleMethod [
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> return1A [
	<gtExample>
	<return: #SmallInteger>
	^ 1
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> return1B [
	<gtExample>
	<return: #SmallInteger>
	^ 1
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> return2 [
	"I call two compiled methods that should be equal (same implementation, but different selectors)"

	<gtExample>
	<return: #SmallInteger>
	^ self return1A + self return1B
]

{ #category : #examples }
GtDummyExamplesOnInstanceSide >> sameExampleCalledTwice [
	<gtExample>
	<return: #SmallInteger>
	^ self e + self e
]
