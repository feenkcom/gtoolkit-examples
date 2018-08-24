Extension { #name : #ZnResponse }

{ #category : #'*GToolkit-Examples-Extensions' }
ZnResponse class >> gtExampleGetEmpty [
	<gtExample>
	<label: 'Response: Bad request <>'>
	
	^ self badRequest: ZnRequest gtExampleGetEmpty
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnResponse class >> gtExampleGetLocalhost8080 [
	<gtExample>
	<label: 'Response: Not Found http://localhost:8080'>
	
	^ self notFound: 'http://localhost:8080'
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnResponse class >> gtExampleGetPharo [
	<gtExample>
	<label: ' Response: Created http://pharo.org'>
	
	^ self created: 'http://pharo.org'
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnResponse class >> gtExampleGetRoot [
	<gtExample>
	<label: 'Response: Redirect /'>
	
	^ self redirect: '/'
]
