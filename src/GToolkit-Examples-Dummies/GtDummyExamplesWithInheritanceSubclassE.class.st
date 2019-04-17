"
I override an existing instance-side example method from my superclass with a method not representing an example.
"
Class {
	#name : #GtDummyExamplesWithInheritanceSubclassE,
	#superclass : #GtDummyExamplesWithInheritanceRoot,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassE class >> exampleH [
	<gtExample>
	^ 'hh'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassE >> exampleB [
	^ 'bb_no_example'
]
