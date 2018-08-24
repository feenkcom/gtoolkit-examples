Class {
	#name : #GtDummyExamplesWithContext,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithContext class >> a [
	<gtExample>
	self assert: self gtExampleContext notNil.
	self gtExampleContext at: #a put: #a.
	^ self gtExampleContext 
]

{ #category : #examples }
GtDummyExamplesWithContext class >> b [
	<gtExample>
	|a c|
	a := self a.
	c := self c.
	self assert: self gtExampleContext notNil.
	self assert: a == self gtExampleContext.
	self assert: c == self gtExampleContext.
	self assert: (self gtExampleContext at: #a) = #a.
	self assert: (self gtExampleContext at: #c) = #c.
]

{ #category : #examples }
GtDummyExamplesWithContext class >> c [
	<gtExample>
	self assert: self gtExampleContext notNil.
	self gtExampleContext at: #c put: #c.
	^ self gtExampleContext 
]
