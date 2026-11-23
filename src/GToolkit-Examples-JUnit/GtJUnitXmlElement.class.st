Class {
	#name : #GtJUnitXmlElement,
	#superclass : #Object,
	#instVars : [
		'xml'
	],
	#category : #'GToolkit-Examples-JUnit-Model'
}

{ #category : #'instance creation' }
GtJUnitXmlElement class >> fromXml: anElement [
	^ self new initializeFromXml: anElement
]

{ #category : #initialization }
GtJUnitXmlElement >> initializeFromXml: anElement [
	xml := anElement
]

{ #category : #accessing }
GtJUnitXmlElement >> name [
	^ xml attributeAt: 'name'
]

{ #category : #printing }
GtJUnitXmlElement >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		nextPutAll: self name;
		nextPut: $)
]

{ #category : #accessing }
GtJUnitXmlElement >> systemErr [
	^ self textOfChildNamed: 'system-err'
]

{ #category : #accessing }
GtJUnitXmlElement >> systemOut [
	^ self textOfChildNamed: 'system-out'
]

{ #category : #private }
GtJUnitXmlElement >> textOfChildNamed: aName [
	^ (xml elements detect: [ :each | each isNamed: aName ] ifNone: [ ^ '' ])
		contentString
]

{ #category : #accessing }
GtJUnitXmlElement >> time [
	^ (xml attributeAt: 'time' ifAbsent: [ ^ nil ]) asNumber
]

{ #category : #accessing }
GtJUnitXmlElement >> xml [
	^ xml
]
