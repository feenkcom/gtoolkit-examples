Class {
	#name : #GtDummyExamplesWithInheritanceRoot,
	#superclass : #GtAbstractDummyExamples,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithInheritanceRoot >> exampleA [
	<gtExample>
	^ 'a'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceRoot >> exampleB [
	<gtExample>
	^ 'b'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceRoot >> exampleC [
	<gtExample>
	^ 'c-', self class name
]
