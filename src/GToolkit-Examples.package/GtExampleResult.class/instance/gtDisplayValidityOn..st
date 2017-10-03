as yet unclassified
gtDisplayValidityOn: aStream
	self isSuccess ifTrue: [ ^ self ].
	
	aStream nextPutAll: ' ['.
	self unexpectedError gtDisplayOn: aStream.
	aStream nextPutAll: ']'