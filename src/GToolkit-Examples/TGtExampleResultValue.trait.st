"
I describe common result value API used in {{gtMethod:GtExampleResult>>#returnValue:}}.
My users then implement specific behavior for success, failure, and error results.

"
Trait {
	#name : #TGtExampleResultValue,
	#category : 'GToolkit-Examples-Core'
}

{ #category : #'api - accessing' }
TGtExampleResultValue >> color [

	"Return a color that represents a result value, e.g., green, yellow, or red color"

	^ Color fromHexString: #f0f0f0
]

{ #category : #ui }
TGtExampleResultValue >> gtLiveFor: aView [
	<gtView>

	^ aView forward
		title: 'Value';
		priority: 10;
		object: [ self value ];
		view: #gtLiveFor:
]

{ #category : #'api - accessing' }
TGtExampleResultValue >> iconForm [

	"Return a Form that represents a result value, e.g., green, yellow, or red color"

	<return: #Form>
	^ ThemeIcons current iconNamed: #testNotRun
]

{ #category : #'api - testing' }
TGtExampleResultValue >> isError [

	^ false
]

{ #category : #'api - testing' }
TGtExampleResultValue >> isFailure [

	^ false
]

{ #category : #'api - testing' }
TGtExampleResultValue >> isSuccess [

	^ false
]

{ #category : #'api - accessing' }
TGtExampleResultValue >> value [

	"Return an example execution result value, e.g., success value or exception"

	^ nil
]
