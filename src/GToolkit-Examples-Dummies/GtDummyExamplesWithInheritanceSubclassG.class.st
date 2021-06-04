"
I define a different set of subjects for my overriden examples.


"
Class {
	#name : #GtDummyExamplesWithInheritanceSubclassG,
	#superclass : #GtDummyExamplesWithInheritanceRoot,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #config }
GtDummyExamplesWithInheritanceSubclassG class >> gtExamplesSubjects [
	^ { Object. GtExample . String }
]
