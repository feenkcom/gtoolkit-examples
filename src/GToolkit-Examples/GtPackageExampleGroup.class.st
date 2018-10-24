Class {
	#name : #GtPackageExampleGroup,
	#superclass : #GtDynamicExampleGroup,
	#instVars : [
		'examplePackage'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtPackageExampleGroup >> examplePackage [
	^ examplePackage
]

{ #category : #accessing }
GtPackageExampleGroup >> examplePackage: anObject [
	examplePackage := anObject
]

{ #category : #accessing }
GtPackageExampleGroup >> examples [
	^ examplePackage gtExamplesContained 
]
