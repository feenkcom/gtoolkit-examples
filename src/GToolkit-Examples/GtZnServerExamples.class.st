Class {
	#name : #GtZnServerExamples,
	#superclass : #Object,
	#instVars : [
		'server'
	],
	#category : #'GToolkit-Examples-Utilities'
}

{ #category : #client }
GtZnServerExamples >> client [
	<gtExample>
	| aServer |
	aServer := self server.
	self assert: aServer isListening.
	^ ZnClient new
		url: self serverUrl
]

{ #category : #server }
GtZnServerExamples >> server [
	<gtExample>
	<after: #stopServer>
	server ifNotNil: [ :aServer | ^ aServer ].
	server := (ZnServer startOn: 0).
	self assert: server port isZero not.
	^ server
]

{ #category : #server }
GtZnServerExamples >> serverPort [
	<gtExample>
	| aPort |
	aPort := self server port.
	self assert: aPort isZero not.
	^ aPort
]

{ #category : #server }
GtZnServerExamples >> serverUrl [
	<gtExample>
	^ ZnUrl new
		scheme: #http;
		host: NetNameResolver loopBackName;
		port: self serverPort;
		yourself.
]

{ #category : #server }
GtZnServerExamples >> stopServer [
	^ server ifNotNil: #stop
]
