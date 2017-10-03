accessing
gtDisplayOn: aStream
	super gtDisplayOn: aStream.
	self signaledException ifNotNil: [
		aStream nextPutAll: ' ('.
		self signaledException gtDisplayOn: aStream.
		aStream nextPutAll: ')' ].