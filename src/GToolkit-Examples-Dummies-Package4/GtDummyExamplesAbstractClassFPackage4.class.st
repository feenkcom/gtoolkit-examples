Class {
	#name : #GtDummyExamplesAbstractClassFPackage4,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Dummies-Package4'
}

{ #category : #testing }
GtDummyExamplesAbstractClassFPackage4 class >> isAbstract [
	^ true
]

{ #category : #examples }
GtDummyExamplesAbstractClassFPackage4 >> exampleInAbstractClassFInPackage4 [
	<gtExample>
	<return: #SmallInteger>
	^ 4 + 40 - 2
]
