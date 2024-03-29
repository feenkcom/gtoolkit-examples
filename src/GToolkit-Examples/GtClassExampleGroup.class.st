Class {
	#name : #GtClassExampleGroup,
	#superclass : #GtDynamicExampleGroup,
	#instVars : [
		'exampleClass',
		'examples'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #jsonV3 }
GtClassExampleGroup class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: #exampleClassName -> #exampleClassName;
		add: #examples -> #examples;
		yourself.
]

{ #category : #accessing }
GtClassExampleGroup class >> leJsonV4Name [

	^ #gtClassExampleGroup
]

{ #category : #accessing }
GtClassExampleGroup >> exampleClass [
	^ exampleClass
]

{ #category : #accessing }
GtClassExampleGroup >> exampleClass: aClass [
	exampleClass := aClass.
	examples := exampleClass gtExamplesContained collect: [ :each | each asExampleWithResult ]
]

{ #category : #'private - serialization' }
GtClassExampleGroup >> exampleClassName [

	^ exampleClass ifNotNil: #name
]

{ #category : #'private - serialization' }
GtClassExampleGroup >> exampleClassName: aSymbol [
	| cls |

	aSymbol ifNil: [ ^ self ].
	cls := (aSymbol endsWith: ' class')
		ifTrue: [ (aSymbol copyFrom: 1 to: aSymbol size - 6) asSymbol asClass class ]
		ifFalse: [ aSymbol asSymbol asClass ].
	self exampleClass: cls.
]

{ #category : #accessing }
GtClassExampleGroup >> examples [
	^ examples
]

{ #category : #'private - serialization' }
GtClassExampleGroup >> examples: aCollection [

	examples := aCollection.
]

{ #category : #subscription }
GtClassExampleGroup >> methodAdded: aMethodAnnouncement [
	aMethodAnnouncement methodAdded methodClass = self exampleClass
		ifTrue: [ 
			examples add: aMethodAnnouncement methodAdded gtExample asExampleWithResult.
			self announcer announce: GtExamplesUpdatedAnnouncement new ]
]

{ #category : #subscription }
GtClassExampleGroup >> methodRemoved: aMethodAnnouncement [
	aMethodAnnouncement methodRemoved methodClass = self exampleClass
		ifTrue: [ 
			examples 
				detect: [:each | each example selector = aMethodAnnouncement methodRemoved selector]
				ifFound: [ :exampleToRemove |
					examples remove: exampleToRemove.
					self announcer announce: GtExamplesUpdatedAnnouncement new ] ]
]

{ #category : #printing }
GtClassExampleGroup >> printOn: aStream [
	super printOn: aStream.
	aStream 
		<< '(';
		<< self exampleClassName;
		<< ')'
]

{ #category : #subscription }
GtClassExampleGroup >> subscribe [
	SystemAnnouncer uniqueInstance weak
		when: MethodAdded send: #methodAdded: to: self;
		when: MethodRemoved send: #methodRemoved: to: self
]
