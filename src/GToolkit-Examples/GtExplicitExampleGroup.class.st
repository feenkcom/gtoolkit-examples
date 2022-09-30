Class {
	#name : #GtExplicitExampleGroup,
	#superclass : #GtExampleGroup,
	#instVars : [
		'examples'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #examples }
GtExplicitExampleGroup class >> gtExampleExplicitEmptyGroup [
	<gtExample>
	^ self new examples: #()
]

{ #category : #jsonV3 }
GtExplicitExampleGroup class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: #examples -> #examples;
		yourself.
]

{ #category : #accessing }
GtExplicitExampleGroup class >> leJsonV4Name [

	^ #gtExplicitExampleGroup
]

{ #category : #accessing }
GtExplicitExampleGroup >> examples [
	^ examples
]

{ #category : #accessing }
GtExplicitExampleGroup >> examples: aCollection [
	self unsubscribeFromExamples.
	examples := aCollection collect: [ :each | each asExampleWithResult ].
	self subscribeToExamples.
	
]

{ #category : #'announcement handling' }
GtExplicitExampleGroup >> handleExampleAnnouncement: aGtExampleAnnouncement [
	self ignoreAnnouncements ifTrue: [ ^ self ].
	self hasAnnouncer ifFalse: [ ^ self ].
	self announcer announce: aGtExampleAnnouncement.
]

{ #category : #initialization }
GtExplicitExampleGroup >> initialize [
	super initialize.
	examples := #().
]

{ #category : #accessing }
GtExplicitExampleGroup >> size [
	^ examples size
]

{ #category : #subscriptions }
GtExplicitExampleGroup >> subscribeToExamples [
	self examples ifNil: [ ^ self ].
	self examples
		do: [ :eachExample | 
			eachExample announcer weak
				when: GtExampleAnnouncement
				send: #handleExampleAnnouncement:
				to: self ]
]

{ #category : #subscriptions }
GtExplicitExampleGroup >> unsubscribeFromExamples [
	self examples ifNil: [ ^ self ].
	self examples do: [ :eachExample | eachExample unsubscribe: self ].
]
