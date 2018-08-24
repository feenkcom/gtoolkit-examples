Extension { #name : #ZnRequest }

{ #category : #'*GToolkit-Examples-Extensions' }
ZnRequest class >> gtExampleGetEmpty [
	<gtExample>
	<label: 'Request message: GET <>'>
	
	^ self method: #GET url: ''
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnRequest class >> gtExampleGetLocalhost8080 [
	<gtExample>
	<label: 'Request message: GET http://localhost:8080'>
	
	^ self method: #GET url: 'http://localhost:8080'
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnRequest class >> gtExampleGetPharo [
	<gtExample>
	<label: 'Request message: GET http://pharo.org'>
	
	^ self method: #GET url: 'http://pharo.org'
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnRequest class >> gtExampleGetRoot [
	<gtExample>
	<label: 'Request message: GET /'>
	
	^ self method: #GET url: '/'
]
