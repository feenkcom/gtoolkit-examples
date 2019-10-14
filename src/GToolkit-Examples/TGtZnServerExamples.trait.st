Trait {
	#name : #TGtZnServerExamples,
	#category : #'GToolkit-Examples-Utilities'
}

{ #category : #server }
TGtZnServerExamples >> delegate [
	<gtExample>
	self zincDelegate ifNotNil: [ :aDelegate | ^ aDelegate ].
	self zincDelegate: ZnDispatcherDelegate new.
	self initializeDelegate.
	^ self zincDelegate
]

{ #category : #server }
TGtZnServerExamples >> initializeDelegate [
	"Classes can initialize the mapping delegate"
]

{ #category : #server }
TGtZnServerExamples >> serverUrl [
	<gtExample>
	self startServer.
	^ self zincExamples serverUrl
]

{ #category : #server }
TGtZnServerExamples >> startServer [
	<gtExample>
	<after: #stopServer>
	| aServer |
	aServer := self zincExamples server.
	self assert: aServer isListening.
	aServer delegate = self delegate ifFalse: [ 
		aServer delegate: self delegate ].
	self assert: aServer delegate equals: self delegate.
	^ aServer
]

{ #category : #server }
TGtZnServerExamples >> stopServer [
	^ self zincExamples stopServer
]

{ #category : #server }
TGtZnServerExamples >> zincDelegate [
	"Return a locally stored server delegate (not by accessing a ZnServer)"
	<return: #ZnDispatcherDelegate>
	^ self explicitRequirement
]

{ #category : #server }
TGtZnServerExamples >> zincDelegate: aZnDispatcherDelegate [
	"Store the server delegate locally to an instance variable"
	self explicitRequirement
]

{ #category : #server }
TGtZnServerExamples >> zincExamples [
	<return: #GtZnServerExamples>
	^ self explicitRequirement
]
