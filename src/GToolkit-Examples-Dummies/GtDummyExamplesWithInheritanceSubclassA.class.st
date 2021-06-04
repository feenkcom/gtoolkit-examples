"
I add a new example method and also override an existing example method from the superclass with a new example method. Only have examples for the instance side.


"
Class {
	#name : #GtDummyExamplesWithInheritanceSubclassA,
	#superclass : #GtDummyExamplesWithInheritanceRoot,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassA >> exampleA [
	<gtExample>
	^ 'aa'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassA >> exampleD [
	<gtExample>
	^ 'd'
]
