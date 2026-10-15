"
I represent no-value in {{gtClass:GtExampleResult}}.
It happens when an example was not executed.
"
Class {
	#name : #GtExampleResultNoValue,
	#superclass : #Object,
	#traits : 'TGtExampleResultValue',
	#classTraits : 'TGtExampleResultValue classTrait',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #cleanup }
GtExampleResultNoValue class >> cleanUp [
	<gsCode: 'SessionTemps current removeKey: #GtExampleResultNoValue_uniqueInstance ifAbsent: []'>

	super cleanUp.
	uniqueInstance := nil
]

{ #category : #accessing }
GtExampleResultNoValue class >> uniqueInstance [
	<gsCode: 'SessionTemps current at: #GtExampleResultNoValue_uniqueInstance ifAbsentPut: [ self new ]'>
	
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]
