Trait {
	#name : 'TGtZnServerExamples',
	#instVars : [
		'zincServer',
		'zincDelegate'
	],
	#category : 'GToolkit-Examples-Utilities'
}

{ #category : 'server - authenticator' }
TGtZnServerExamples >> basicAuthenticator [
	<gtExample>
	^ ZnBasicAuthenticator
		username: self joeDoeUsername
		password: self joeDoePassword
]

{ #category : 'server - basic' }
TGtZnServerExamples >> basicServer [
	<gtExample>
	<after: #stopServer>
	zincServer ifNotNil: [ :aServer | ^ aServer ].
	zincServer := (ZnServer startOn: 0).
	self assert: zincServer port isZero not.
	^ zincServer
]

{ #category : 'server - authenticator' }
TGtZnServerExamples >> cleanServerAuthenticator [
	<gtExample>
	| aServer |
	aServer := self server.
	aServer authenticator: nil.
	self assert: aServer authenticator isNil.
	^ aServer
]

{ #category : 'client - basic' }
TGtZnServerExamples >> client [
	<gtExample>
	| aServer |
	aServer := self basicServer.
	self assert: aServer isListening.
	^ ZnClient new
		url: self serverUrl
]

{ #category : 'server - delegate' }
TGtZnServerExamples >> defaultDelegate [
	^ ZnDispatcherDelegate new
]

{ #category : 'server - delegate' }
TGtZnServerExamples >> delegate [
	<gtExample>
	zincDelegate ifNotNil: [ :aDelegate | ^ aDelegate ].
	zincDelegate := self defaultDelegate.
	self initializeDelegate.
	^ zincDelegate
]

{ #category : 'server - delegate' }
TGtZnServerExamples >> initializeDelegate [
	"Classes can initialize the mapping delegate"
]

{ #category : 'server - authenticator' }
TGtZnServerExamples >> joeDoePassword [
	^ 'Joe Doe''s secret password'
]

{ #category : 'server - authenticator' }
TGtZnServerExamples >> joeDoeUsername [
	^ 'JoeDoe'
]

{ #category : 'server - basic' }
TGtZnServerExamples >> server [
	<gtExample>
	| aServer |
	aServer := self basicServer.
	aServer delegate = self delegate ifFalse: [ 
		aServer delegate: self delegate ].
	self assert: aServer delegate equals: self delegate.
	^ aServer
]

{ #category : 'server - basic' }
TGtZnServerExamples >> serverPort [
	<gtExample>
	| aPort |
	aPort := self basicServer port.
	self assert: aPort isZero not.
	^ aPort
]

{ #category : 'server - basic' }
TGtZnServerExamples >> serverUrl [
	<gtExample>
	^ ZnUrl new
		scheme: #http;
		host: NetNameResolver loopBackName;
		port: self serverPort;
		yourself.
]

{ #category : 'server - authenticator' }
TGtZnServerExamples >> setServerBasicAuthenticator [
	<gtExample>
	| aServer anAuthenticator |
	aServer := self server.
	anAuthenticator := self basicAuthenticator.
	aServer authenticator: anAuthenticator.
	self assert: aServer authenticator equals: anAuthenticator.
	^ aServer
]

{ #category : 'server - basic' }
TGtZnServerExamples >> stopServer [
	^ zincServer ifNotNil: #stop
]
