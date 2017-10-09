ui
gtDisplayOn: aStream
	self example gtDisplayOn: aStream. 
	
	self exampleException ifNotNil: [ 
		aStream nextPutAll: ' ['.
		self exampleException gtDisplayOn: aStream.
		aStream nextPutAll: ']' ]