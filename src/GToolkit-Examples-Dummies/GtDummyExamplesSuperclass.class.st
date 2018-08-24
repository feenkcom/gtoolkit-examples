Class {
	#name : #GtDummyExamplesSuperclass,
	#superclass : #GtAbstractDummyExamples,
	#category : 'GToolkit-Examples-Dummies-Data'
}

{ #category : #examples }
GtDummyExamplesSuperclass >> aSuperclass [
	<gtExample>
	^ 1
]

{ #category : #examples }
GtDummyExamplesSuperclass >> bInBoth [
	<gtExample>
	^ 1
]

{ #category : #examples }
GtDummyExamplesSuperclass >> dCallSuper [
	"The example here is mean to be override and called from a subclass"
	<gtExample>
	^ 1
]
