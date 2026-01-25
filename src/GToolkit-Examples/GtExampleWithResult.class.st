"
I am example that further stores the result of evaluating the example.


"
Class {
	#name : #GtExampleWithResult,
	#superclass : #Object,
	#instVars : [
		'example',
		'result',
		'announcer',
		'mutex'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #jsonV3 }
GtExampleWithResult class >> leJsonV4AttributeMapping [ 

	^ { 
		#exampleSton -> #example.
		#simplifiedResult -> #result.
	}
]

{ #category : #accessing }
GtExampleWithResult class >> leJsonV4Name [ 

	^ #gtExampleWithResult
]

{ #category : #comparing }
GtExampleWithResult >> = anExample [
	^ self class = anExample class and: [ 
		self example = anExample example ]
]

{ #category : #accessing }
GtExampleWithResult >> after [
	^ self example after
]

{ #category : #accessing }
GtExampleWithResult >> announcer [
	<return: #Announcer>
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GtExampleWithResult >> announcer: anAnnouncer [
	self 
		assert: [ anAnnouncer isNotNil ]
		description: [ 'Example Announcer must be non-nil' ].
	announcer := anAnnouncer
]

{ #category : #converting }
GtExampleWithResult >> asCachedExampleWithResult [
	"I do not ensure that I am really a cached instance.
	{{gtClass:GtExample}} instances ensure cached instances.
	On other hand, it is likely that I am already cached."

	^ self
]

{ #category : #converting }
GtExampleWithResult >> asExampleWithResult [
	^ self
]

{ #category : #testing }
GtExampleWithResult >> canBeExecuted [
	"Return true if example can be executed"
	<return: #Boolean>
	^ self example canBeExecuted
]

{ #category : #accessing }
GtExampleWithResult >> changeArguments: aCollection [
	(self example changeArguments: aCollection) ifFalse: [ ^ self ].
	self notifyArgumentsChanged. 
	
]

{ #category : #ui }
GtExampleWithResult >> color [
	<return: #Color>
	^ self result 
			ifNotNil: #color
			ifNil: [ Color fromHexString: #'f0f0f0' ]
]

{ #category : #public }
GtExampleWithResult >> debug [
	self result: self example debug
]

{ #category : #accessing }
GtExampleWithResult >> directDependencies [
	^ self example directDependencies collect: #asExampleWithResult
]

{ #category : #public }
GtExampleWithResult >> ensureResult [
	<return: #GtExampleResult>
	mutex critical: [ self hasResult ifFalse: [ self run ] ].
	^ self result
]

{ #category : #accessing }
GtExampleWithResult >> example [
	^ example
]

{ #category : #accessing }
GtExampleWithResult >> example: anObject [
	example := anObject
]

{ #category : #'private - serialization' }
GtExampleWithResult >> exampleSton [

	^ [ STON toString: example ]
		on: Error 
		do: [ :ex | 'Unable to encode: ', example printString, String lf, ex printString. ]
]

{ #category : #'private - serialization' }
GtExampleWithResult >> exampleSton: aString [

	example := [ STON fromString: aString ]
		on: Error
		do: [ :ex | aString ].

]

{ #category : #accessing }
GtExampleWithResult >> gtConnectionsFor: aView [
	<gtView>
	^ self example gtConnectionsFor: aView
]

{ #category : #'gt - extensions' }
GtExampleWithResult >> gtDependenciesFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Dependencies';
		priority: 50;
		object: [ self example ];
		view: #gtDependenciesFor:
]

{ #category : #'gt - extensions' }
GtExampleWithResult >> gtDependenciesGraphFor: aView [
	<gtView>
	^ self example gtDependenciesGraphFor: aView
]

{ #category : #printing }
GtExampleWithResult >> gtDisplayOn: stream [
	self example gtDisplayOn: stream
]

{ #category : #'as yet unclassified' }
GtExampleWithResult >> gtExample [
	<gtExamplePragma>
	<description: 'This method is turned into a gtExample if provided'>
	
	^ self
]

{ #category : #ui }
GtExampleWithResult >> gtExampleFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Example';
		priority: 10;
		object: [ example ];
		view: #gtLiveFor:
]

{ #category : #ui }
GtExampleWithResult >> gtInspectorActions [
	^ super gtInspectorActions addAll: self example gtInspectorActions; yourself
]

{ #category : #ui }
GtExampleWithResult >> gtInspectorPresentationsIn: composite inContext: aGTInspector [
	"we collect all presentations from the wrapped example"
	super gtInspectorPresentationsIn: composite inContext: aGTInspector.
	self example gtInspectorPresentationsIn: composite inContext: aGTInspector
]

{ #category : #ui }
GtExampleWithResult >> gtLiveFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Result';
		priority: 15;
		object: [ result ];
		view: #gtLiveFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect action: [ :b | b phlow spawnObject: result returnValue ]
]

{ #category : #testing }
GtExampleWithResult >> hasAfter [
	^ self example hasAfter 
]

{ #category : #testing }
GtExampleWithResult >> hasAfterInDependencies [
	^ example hasAfterInDependencies
]

{ #category : #testing }
GtExampleWithResult >> hasAnnouncer [
	^ announcer isNotNil
]

{ #category : #testing }
GtExampleWithResult >> hasNoTestPragma [
	^ self example hasNoTestPragma
]

{ #category : #testing }
GtExampleWithResult >> hasResult [
	^ result notNil
]

{ #category : #comparing }
GtExampleWithResult >> hash [
	^ self class hash bitXor: self example hash
]

{ #category : #ui }
GtExampleWithResult >> icon [
	<return: #Form>
	^ self result 
			ifNotNil: #icon
			ifNil: [ ThemeIcons current iconNamed: #testNotRun ]
]

{ #category : #testing }
GtExampleWithResult >> ignoreTest [
	^ self example ignoreTest
]

{ #category : #initialization }
GtExampleWithResult >> initialize [
	super initialize.

	mutex := Mutex new
]

{ #category : #testing }
GtExampleWithResult >> isError [
	^ self hasResult and: [ self result isError ]
]

{ #category : #testing }
GtExampleWithResult >> isErrorInCheckLogic [
	^ self isError
]

{ #category : #testing }
GtExampleWithResult >> isFailure [
	^ self hasResult and: [ self result isFailure ]
]

{ #category : #testing }
GtExampleWithResult >> isGtExample [

	^ true
]

{ #category : #accessing }
GtExampleWithResult >> isMethodDefined [
	^ self example isMethodDefined
]

{ #category : #testing }
GtExampleWithResult >> isSUnitTestCase [

	^ false
]

{ #category : #testing }
GtExampleWithResult >> isSkipped [
	^ self hasResult not
]

{ #category : #testing }
GtExampleWithResult >> isSuccess [
	^ self hasResult and: [ self result isSuccess ]
]

{ #category : #testing }
GtExampleWithResult >> isUnableToCompleteCheckError [
	^ false
]

{ #category : #accessing }
GtExampleWithResult >> isValid [
	^ self example isValid
]

{ #category : #testing }
GtExampleWithResult >> isWarning [
	"Examples do not handle warnings. This exists so that examples with results are polymorphic with test results."
	
	^ false
]

{ #category : #accessing }
GtExampleWithResult >> method [
	^ self example method
]

{ #category : #accessing }
GtExampleWithResult >> methodClass [
	^ self example methodClass
]

{ #category : #accessing }
GtExampleWithResult >> methodDo: aBlockClosure [
	self example methodDo: aBlockClosure
]

{ #category : #accessing }
GtExampleWithResult >> methodPackage [
	<return: #Package>
	^ self example methodPackage
]

{ #category : #accessing }
GtExampleWithResult >> noTest [
	^ self example noTest
]

{ #category : #notifying }
GtExampleWithResult >> notifyArgumentsChanged [
	| anAnnouncement |
	self hasAnnouncer ifFalse: [ ^ self ].
	anAnnouncement := GtExampleArgumentsChanged new example: self.
	self announcer announce: anAnnouncement.
]

{ #category : #notifying }
GtExampleWithResult >> notifyExampleExecuted [
	| anAnnouncement |
	self hasAnnouncer ifFalse: [ ^ self ].
	anAnnouncement := GtExampleExecuted new example: self.
	self announcer announce: anAnnouncement.
]

{ #category : #accessing }
GtExampleWithResult >> numberOfRequieredArguments [
	<return: #Integer>
	^ self example numberOfRequieredArguments
]

{ #category : #public }
GtExampleWithResult >> openDebugger [
	self result: self example openDebugger
]

{ #category : #accessing }
GtExampleWithResult >> openingDebugger [
	<return: #GtExampleOpenDebugger>
	^ self example openingDebugger
		callback: [ :anExampleResult | self result: anExampleResult ]
]

{ #category : #accessing }
GtExampleWithResult >> providerClass [
	^ self example providerClass
]

{ #category : #accessing }
GtExampleWithResult >> result [
	<return: #GtExampleResult>
	^ result
]

{ #category : #accessing }
GtExampleWithResult >> result: aGtExampleResult [
	result == aGtExampleResult ifTrue: [ ^ self ].
	result := aGtExampleResult.
	self notifyExampleExecuted
]

{ #category : #printing }
GtExampleWithResult >> resultOrErrorName [

	^ self hasResult
		  ifTrue: [ self result returnValue class name asString ]
		  ifFalse: [ 'N/A' ]
]

{ #category : #accessing }
GtExampleWithResult >> returnValue [
	^ self ensureResult returnValue
]

{ #category : #public }
GtExampleWithResult >> run [
	<return: #GtExampleResult>
	mutex critical: [ self result: self example run ].
	^ self result
]

{ #category : #accessing }
GtExampleWithResult >> selector [
	^ self example selector
]

{ #category : #'private - serialization' }
GtExampleWithResult >> simplifiedResult [

	result ifNotNil: [ result beSafeSimplifiedExampleResultValue ].
	^ result
]

{ #category : #'private - serialization' }
GtExampleWithResult >> simplifiedResult: aResultValue [

	result := aResultValue.
	"The example is encoded separately, but if a result is present, has its own copy.
	Same memory and use just one instance."
	example := aResultValue example.
]

{ #category : #accessing }
GtExampleWithResult >> sourceCode [
	<return: #String>
	^ self example sourceCode
]

{ #category : #printing }
GtExampleWithResult >> statusText [
	self hasResult
		ifTrue: [ self isSuccess
			ifTrue: [ ^ 'Success' ]
			ifFalse: [ 
				self isError ifTrue: [ ^ 'Error' ].
				self isFailure ifTrue: [ ^ 'Failure' ].
				 ^ 'Problem' ] ]
		ifFalse: [ ^ 'N/A' ]
]

{ #category : #printing }
GtExampleWithResult >> statusTextWithResultValueClassName [
	| status resultOrErrorClassName |
	status := self statusText.
	resultOrErrorClassName := self resultOrErrorName.
	resultOrErrorClassName ifNotNil: [ status := status , ': ' , resultOrErrorClassName ].
	^ status
]
