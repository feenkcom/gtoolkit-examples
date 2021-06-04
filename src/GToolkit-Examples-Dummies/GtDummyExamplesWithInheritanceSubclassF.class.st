"
I override existing class-side and instance-side example methods from my superclass with methods not representing an example.


"
Class {
	#name : #GtDummyExamplesWithInheritanceSubclassF,
	#superclass : #GtDummyExamplesWithInheritanceSubclassE,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassF class >> exampleA [
	^ 'aaa_no_example'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassF class >> exampleH [
	^ 'hhh_no_example'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassF >> exampleA [
	^ 'aa_no_example'
]
