"
I represent a success value in {{gtClass:GtExampleResult}}.
"
Class {
	#name : #GtExampleResultSuccessValue,
	#superclass : #Object,
	#traits : 'TGtExampleResultValue',
	#classTraits : 'TGtExampleResultValue classTrait',
	#instVars : [
		'value'
	],
	#category : 'GToolkit-Examples-Core'
}

{ #category : #'api - accessing' }
GtExampleResultSuccessValue >> color [

	^ Color fromHexString: #'95de64'
]

{ #category : #'api - accessing' }
GtExampleResultSuccessValue >> iconForm [

	^ ThemeIcons current iconNamed: #testGreen
]

{ #category : #'api - testing' }
GtExampleResultSuccessValue >> isSuccess [

	^ true
]

{ #category : #'api - accessing' }
GtExampleResultSuccessValue >> value [

	^ value
]

{ #category : #accessing }
GtExampleResultSuccessValue >> value: anObject [

	self
		assert: [ value isNil ]
		description: [ 'Success value can be initialized only once' ].

	value := anObject
]
