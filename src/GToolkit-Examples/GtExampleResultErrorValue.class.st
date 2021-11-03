"
I represent an error value in {{gtClass:GtExampleResult}}.
"
Class {
	#name : #GtExampleResultErrorValue,
	#superclass : #Object,
	#traits : 'TGtExampleResultValue',
	#classTraits : 'TGtExampleResultValue classTrait',
	#instVars : [
		'exception'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #accessing }
GtExampleResultErrorValue >> asGtSimplifiedExampleResultValue [

	^ GtExampleResultSimplifiedErrorValue new description:
		  self exception printString
]

{ #category : #'api - accessing' }
GtExampleResultErrorValue >> color [

	^ Color fromHexString: #ff7875
]

{ #category : #accessing }
GtExampleResultErrorValue >> exception [

	^ exception
]

{ #category : #accessing }
GtExampleResultErrorValue >> exception: anException [

	self
		assert: [ exception isNil ]
		description: [ 'Exception value can be initialized only once' ].

	exception := anException
]

{ #category : #'api - accessing' }
GtExampleResultErrorValue >> iconForm [

	^ ThemeIcons current iconNamed: #testRed
]

{ #category : #'api - testing' }
GtExampleResultErrorValue >> isError [

	^ true
]

{ #category : #'api - accessing' }
GtExampleResultErrorValue >> value [

	^ self exception
]
