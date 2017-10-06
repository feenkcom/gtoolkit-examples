ui
gtDisplayOn: aStream
	self example gtDisplayOn: aStream. 
	
	self unexpectedError ifNotNil: [ 
		aStream nextPutAll: ' ['.
		self unexpectedError gtDisplayOn: aStream.
		aStream nextPutAll: ']' ]