Trait {
	#name : #TGtZnServerExamples,
	#instVars : [
		'zincServer',
		'zincDelegate'
	],
	#category : #'GToolkit-Examples-Utilities'
}

{ #category : #'server - authenticator' }
TGtZnServerExamples >> basicAuthenticator [
	<gtExample>
	<return: #ZnBasicAuthenticator>
	<return: #Error>
	^ ZnBasicAuthenticator
		username: self joeDoeUsername
		password: self joeDoePassword
]

{ #category : #'server - basic' }
TGtZnServerExamples >> basicServer [
	<gtExample>
	<after: #stopServer>
	<return: #ZnManagingMultiThreadedServer>
	<return: #Error>
	zincServer ifNotNil: [ :aServer | ^ aServer ].
	zincServer := ZnServer startOn: 0.
	self assert: zincServer port isZero not.
	^ zincServer
]

{ #category : #'server - authenticator' }
TGtZnServerExamples >> cleanServerAuthenticator [
	<gtExample>
	<return: #ZnManagingMultiThreadedServer>
	<return: #MessageNotUnderstood>
	| aServer |
	aServer := self server.
	aServer authenticator: nil.
	self assert: aServer authenticator isNil.
	^ aServer
]

{ #category : #'client - basic' }
TGtZnServerExamples >> client [
	<gtExample>
	<return: #ZnClient>
	<return: #MessageNotUnderstood>
	| aServer |
	aServer := self basicServer.
	self assert: aServer isListening.
	^ ZnClient new url: self serverUrl
]

{ #category : #'server - delegate' }
TGtZnServerExamples >> defaultDelegate [
	^ ZnDispatcherDelegate new
]

{ #category : #'server - delegate' }
TGtZnServerExamples >> delegate [
	<gtExample>
	<return: #ZnDispatcherDelegate>
	<return: #Error>
	zincDelegate ifNotNil: [ :aDelegate | ^ aDelegate ].
	zincDelegate := self defaultDelegate.
	self initializeDelegate.
	^ zincDelegate
]

{ #category : #'server - delegate' }
TGtZnServerExamples >> initializeDelegate [
	"Classes can initialize the mapping delegate"
]

{ #category : #'server - authenticator' }
TGtZnServerExamples >> joeDoePassword [
	^ 'Joe Doe''s secret password'
]

{ #category : #'server - authenticator' }
TGtZnServerExamples >> joeDoeUsername [
	^ 'JoeDoe'
]

{ #category : #'server - basic' }
TGtZnServerExamples >> server [
	<gtExample>
	<return: #ZnManagingMultiThreadedServer>
	<return: #MessageNotUnderstood>
	| aServer |
	aServer := self basicServer.
	aServer delegate = self delegate ifFalse: [ aServer delegate: self delegate ].
	self assert: aServer delegate equals: self delegate.
	^ aServer
]

{ #category : #'server - basic' }
TGtZnServerExamples >> serverPort [
	<gtExample>
	<return: #SmallInteger>
	<return: #MessageNotUnderstood>
	| aPort |
	aPort := self basicServer port.
	self assert: aPort isZero not.
	^ aPort
]

{ #category : #'server - basic' }
TGtZnServerExamples >> serverUrl [
	<gtExample>
	<return: #ZnUrl>
	<return: #MessageNotUnderstood>
	^ ZnUrl new
		scheme: #http;
		host: NetNameResolver loopBackName;
		port: self serverPort;
		yourself
]

{ #category : #'server - authenticator' }
TGtZnServerExamples >> setServerBasicAuthenticator [
	<gtExample>
	<return: #ZnManagingMultiThreadedServer>
	<return: #MessageNotUnderstood>
	| aServer anAuthenticator |
	aServer := self server.
	anAuthenticator := self basicAuthenticator.
	aServer authenticator: anAuthenticator.
	self assert: aServer authenticator equals: anAuthenticator.
	^ aServer
]

{ #category : #'server - basic' }
TGtZnServerExamples >> stopServer [
	^ zincServer ifNotNil: #stop
]
