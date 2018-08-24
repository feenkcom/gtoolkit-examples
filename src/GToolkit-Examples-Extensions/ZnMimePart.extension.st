Extension { #name : #ZnMimePart }

{ #category : #'*GToolkit-Examples-Extensions' }
ZnMimePart class >> gtExampleEmptyField [
	<gtExample>
	<label: 'Empty field'>
	
	^ self fieldName: 'value' value: ''
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnMimePart class >> gtExampleField [
	<gtExample>
	<label: 'Field'>
	
	^ self fieldName: 'message' value: 'hello world'
]

{ #category : #'*GToolkit-Examples-Extensions' }
ZnMimePart class >> gtExampleFile [
	<gtExample>
	<label: 'File'>
	
	^ self 
		fieldName: 'file' 
		fileName: 'message.txt' 
		entity: (ZnEntity text: 'Hello World')
]
