"
I represent a failure value in {{gtClass:GtExampleResult}}.
"
Class {
	#name : #GtExampleResultFailureValue,
	#superclass : #Object,
	#traits : 'TGtExampleResultValue',
	#classTraits : 'TGtExampleResultValue classTrait',
	#instVars : [
		'failure'
	],
	#category : 'GToolkit-Examples-Core'
}

{ #category : #'api - accessing' }
GtExampleResultFailureValue >> color [

	^ Color fromHexString: #ffd666
]

{ #category : #accessing }
GtExampleResultFailureValue >> failure [

	^ failure
]

{ #category : #accessing }
GtExampleResultFailureValue >> failure: anException [

	self
		assert: [ failure isNil ]
		description: [ 'Failure value can be initialized only once' ].

	failure := anException
]

{ #category : #'api - accessing' }
GtExampleResultFailureValue >> iconForm [

	^ ThemeIcons current iconNamed: #testYellow
]

{ #category : #'api - testing' }
GtExampleResultFailureValue >> isFailure [

	^ true
]

{ #category : #'api - accessing' }
GtExampleResultFailureValue >> value [

	^ self failure
]
