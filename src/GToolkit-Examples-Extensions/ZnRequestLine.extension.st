Extension { #name : #ZnRequestLine }

{ #category : #'*GToolkit-Examples-Extensions' }
ZnRequestLine class >> gtExampleGetEmpty [
	<gtExample>
	<label: 'Request line: GET <>'>
	
	^ self method: #GET uri: ''
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnRequestLine class >> gtExampleGetLocalhost8080 [
	<gtExample>
	<label: 'Request line: GET http://localhost:8080'>
	
	^ self method: #GET uri: 'http://localhost:8080'
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnRequestLine class >> gtExampleGetPharo [
	<gtExample>
	<label: 'Request line: GET http://pharo.org'>
	
	^ self method: #GET uri: 'http://pharo.org'
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnRequestLine class >> gtExampleGetRoot [
	<gtExample>
	<label: 'Request line: GET /'>
	
	^ self method: #GET uri: '/'
]
