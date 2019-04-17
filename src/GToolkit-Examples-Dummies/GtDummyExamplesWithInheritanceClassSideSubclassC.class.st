"
I provide example methods, both on the class and instance side, that have the same method names. I also override examples on both the class and the instance side.
"
Class {
	#name : #GtDummyExamplesWithInheritanceClassSideSubclassC,
	#superclass : #GtDummyExamplesWithInheritanceRoot,
	#category : #'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesWithInheritanceClassSideSubclassC class >> exampleA [
	<gtExample>
	^ 'aa_class'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceClassSideSubclassC class >> exampleB [
	<gtExample>
	^ 'bb_class'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceClassSideSubclassC class >> exampleD [
	<gtExample>
	^ 'dd_class'
]

{ #category : #examples }
GtDummyExamplesWithInheritanceClassSideSubclassC >> exampleB [
	<gtExample>
	^ 'bb'
]
