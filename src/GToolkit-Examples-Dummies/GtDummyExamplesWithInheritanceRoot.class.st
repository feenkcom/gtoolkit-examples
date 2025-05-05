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
	<return: #ByteString>
	^ 'a'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceRoot >> exampleB [
	<gtExample>
	<return: #ByteString>
	^ 'b'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceRoot >> exampleC [
	<gtExample>
	<return: #ByteString>
	^ 'c-' , self class name
]
