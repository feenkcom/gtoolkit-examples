"
I am an error that occurs when an example declares a dependency to a method belonging to a class that does not exist in the image.


"
Class {
	#name : #GtExampleDeclaredClassMissing,
	#superclass : #GtExamplePragmaError,
	#instVars : [
		'classNamed',
		'meta'
	],
	#category : #'GToolkit-Examples-Exceptions'
}

{ #category : #accessing }
GtExampleDeclaredClassMissing >> classNamed [
	^ classNamed
]

{ #category : #accessing }
GtExampleDeclaredClassMissing >> classNamed: anObject [
	classNamed := anObject
]

{ #category : #accessing }
GtExampleDeclaredClassMissing >> meta [

	^ meta
]

{ #category : #accessing }
GtExampleDeclaredClassMissing >> meta: anObject [

	meta := anObject
]
