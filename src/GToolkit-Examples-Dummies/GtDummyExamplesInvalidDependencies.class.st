Class {
	#name : #GtDummyExamplesInvalidDependencies,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesInvalidDependencies class >> a [
	<gtExample>
	<label: 'Dummy #a'>
	<description: 'dependency missing'>
	<noTest>
	
	self a1
]

{ #category : #examples }
GtDummyExamplesInvalidDependencies class >> b [
	<gtExample>
	<label: 'Dummy #b'>
	<description: 'dependency missing / should pass as the exception is expected'>
	
	self should: [ self a1 ] raise: MessageNotUnderstood
	
]

{ #category : #examples }
GtDummyExamplesInvalidDependencies class >> c [
	<gtExample>
	<label: 'Dummy #c:c:'>
	<description: 'depends on example with wring dependency'>
	<noTest>
	
	self a
	
]
