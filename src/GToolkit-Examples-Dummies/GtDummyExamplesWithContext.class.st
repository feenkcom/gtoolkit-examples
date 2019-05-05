Class {
	#name : #GtDummyExamplesWithContext,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithContext class >> a [
	<gtExample>
	self assert: self gtExampleRuntimeContext notNil.
	self gtExampleRuntimeContext at: #a put: #a.
	^ self gtExampleRuntimeContext 
]

{ #category : #examples }
GtDummyExamplesWithContext class >> b [
	<gtExample>
	|a c|
	a := self a.
	c := self c.
	self assert: self gtExampleRuntimeContext notNil.
	self assert: a == self gtExampleRuntimeContext.
	self assert: c == self gtExampleRuntimeContext.
	self assert: (self gtExampleRuntimeContext at: #a) = #a.
	self assert: (self gtExampleRuntimeContext at: #c) = #c.
]

{ #category : #examples }
GtDummyExamplesWithContext class >> c [
	<gtExample>
	self assert: self gtExampleRuntimeContext notNil.
	self gtExampleRuntimeContext at: #c put: #c.
	^ self gtExampleRuntimeContext 
]
