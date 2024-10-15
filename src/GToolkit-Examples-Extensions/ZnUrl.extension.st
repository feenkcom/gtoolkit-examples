Extension { #name : #ZnUrl }

{ #category : #'*Gtoolkit-Examples-Extensions' }
ZnUrl >> exampleConstructed [
	<gtExample>
	
	self
		scheme: #https;
		host: 'host.com';
		port: 8888;
		addPathSegments: #( 'path' 'one' 'two' 'file.txt' );
		queryAt: #line put: 20;
		queryAt: #raw put: nil;
		fragment: #position.
	
	self assert: self scheme = #https.
	self assert: self isHttps.
	self assert: self host = 'host.com'.
	self assert: self port = 8888.
	self assert: self path = 'path/one/two/file.txt'.
	self assert: self isFilePath.
	self assert: (self queryAt: #line) = '20'.
	self assert: (self queryAt: #raw ifAbsent: [ #error ]) isNil.
	self assert: self fragment = #position.
	
	self assert: self printString = 'https://host.com:8888/path/one/two/file.txt?line=20&raw#position'
]

{ #category : #'*Gtoolkit-Examples-Extensions' }
ZnUrl >> exampleParsed [
	<gtExample>

	self
		parseFrom: 'https://host.com:8888/path/one/two/file.txt?line=20&raw#position'.

	self assert: self scheme = #https.
	self assert: self isHttps.
	self assert: self host = 'host.com'.
	self assert: self port = 8888.
	self assert: self path = 'path/one/two/file.txt'.
	self assert: self isFilePath.
	self assert: (self queryAt: #line) = '20'.
	self assert: (self queryAt: #raw ifAbsent: [ #error ]) isNil.
	self assert: self fragment = 'position'
]
