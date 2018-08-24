Class {
	#name : #GtExampleResolverTest,
	#superclass : #TestCase,
	#category : 'GToolkit-Tests-Examples'
}

{ #category : #asserting }
GtExampleResolverTest >> assertClass: aClassOrClassName meta: aBoolean resolvedAsClass: aClass [ 
	(GtExampleMethodResolver new 
		methodClassName: aClassOrClassName;
		meta: aBoolean;
		yourself) methodClassDo: [ :class | self assert: class == aClass ] ifNone: [ self assert: aClass isNil ].
	(GtExampleClassResolver new 
		theClassName: aClassOrClassName;
		meta: aBoolean;
		yourself) theClassDo: [ :class | self assert: class == aClass ] ifNone: [ self assert: aClass isNil ]
]

{ #category : #asserting }
GtExampleResolverTest >> testResolve [
	self assertClass: 'Object' meta: false resolvedAsClass: Object.
	self assertClass: 'Object' meta: true resolvedAsClass: Object class.
	
	self assertClass: #Object meta: false resolvedAsClass: Object.
	self assertClass: #Object meta: true resolvedAsClass: Object class.
]

{ #category : #asserting }
GtExampleResolverTest >> testResolveWithCompatibility [
	self assertClass: 'Object class' meta: false resolvedAsClass: Object class.
	self assertClass: 'Object class' meta: true resolvedAsClass: Object class.
	
	self assertClass: #'Object class' meta: false resolvedAsClass: Object class.
	self assertClass: #'Object class' meta: true resolvedAsClass: Object class.
	
]
