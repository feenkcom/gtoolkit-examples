Class {
	#name : #GtPackageExampleGroup,
	#superclass : #GtDynamicExampleGroup,
	#instVars : [
		'examplePackage',
		'examples'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #jsonV3 }
GtPackageExampleGroup class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: #examplePackageName -> #examplePackageName;
		add: #examples -> #examples;
		yourself.
]

{ #category : #accessing }
GtPackageExampleGroup class >> leJsonV4Name [

	^ #gtPackageExampleGroup
]

{ #category : #accessing }
GtPackageExampleGroup >> examplePackage [
	^ examplePackage
]

{ #category : #accessing }
GtPackageExampleGroup >> examplePackage: anObject [
	examplePackage := anObject.
	examples := examplePackage gtExamplesContained collect: [ :each | each asExampleWithResult ]
]

{ #category : #'private - serialization' }
GtPackageExampleGroup >> examplePackageName [

	^ examplePackage name
]

{ #category : #'private - serialization' }
GtPackageExampleGroup >> examplePackageName: aString [

	self examplePackage: aString asPackage
]

{ #category : #accessing }
GtPackageExampleGroup >> examples [
	^ examples
]
