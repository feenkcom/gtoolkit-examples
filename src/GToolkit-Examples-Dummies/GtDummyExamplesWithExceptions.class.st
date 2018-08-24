Class {
	#name : #GtDummyExamplesWithExceptions,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #'examples 1' }
GtDummyExamplesWithExceptions class >> a [
	<gtExample>
	<label: 'Dummy #a'>
	<description: 'Dummy #a, raises ZeroDivide'>
	
	self should: [ 1/0 ] raise: ZeroDivide
]

{ #category : #'examples 1' }
GtDummyExamplesWithExceptions class >> b [
	<gtExample>
	<label: 'Dummy #b'>
	<description: 'Dummy #b, does not raise ZeroDivide'>
	
	^ self a
]

{ #category : #'examples 1' }
GtDummyExamplesWithExceptions class >> c [
	<gtExample>
	<label: 'Dummy #c'>
	<description: 'Dummy #c, does not ZeroDivide'>
	
	^ self b
]

{ #category : #'examples 2' }
GtDummyExamplesWithExceptions class >> d [
	<gtExample>
	<label: 'Dummy #d'>
	<description: 'Dummy #d, raises AssertionFailure'>
	
	self should: [ self assert: false ] raise: AssertionFailure
]

{ #category : #'examples 3' }
GtDummyExamplesWithExceptions class >> e [
	<gtExample>
	<label: 'Dummy #e'>
	<description: 'Dummy #e, raises an exception (AssertionFailure) since we did not catch it'>
	<noTest>
	
	self assert: 42 = 'fourty two'
]

{ #category : #'examples 3' }
GtDummyExamplesWithExceptions class >> f [
	<gtExample>
	<label: 'Dummy #f'>
	<description: 'Dummy #f, depends on #b which raises an expected exception'>
	
	self should: [ self assert: 1/0  ] raise: ZeroDivide
]

{ #category : #'examples 3' }
GtDummyExamplesWithExceptions class >> g [
	<gtExample>
	<label: 'Dummy #g'>
	<description: 'Dummy #g, depends on #e, should raise an exception since the only dependency is raising an exception'>
	<noTest>
	
	^ self e
]

{ #category : #'examples 3' }
GtDummyExamplesWithExceptions class >> h [
	<gtExample>
	<label: 'Dummy #h'>
	<description: 'Dummy #h,  does not raise exception'>
	<noTest>
	
	self assert: true. " no exception raised -> expected exception not raises"
	true " no exception raised -> expected exception not raises "
		ifTrue: [ ^ 1 ] 
		ifFalse: [ 1/0 ]
]

{ #category : #'examples 3' }
GtDummyExamplesWithExceptions class >> j [
	<gtExample>
	<label: 'Dummy #j'>
	<description: 'Dummy #i, raise an unexpected error'>
	<noTest>
	
	1/0
]
