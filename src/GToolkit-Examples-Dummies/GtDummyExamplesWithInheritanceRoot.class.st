"
I provide examples methods used to test the overriding of examples. 

My subclasses defined examples on both the class and instance side, and override them with either example or normal methods.


"
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
