"
As my superclass, I only add new examples methods on the instance side without overriding any existing ones. 
"
Class {
	#name : #GtDummyExamplesWithInheritanceSubclassOfSubclassB,
	#superclass : #GtDummyExamplesWithInheritanceSubclassB,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithInheritanceSubclassOfSubclassB >> exampleH [
	<gtExample>
	^ 'hhh'
]
