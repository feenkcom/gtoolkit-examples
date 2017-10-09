ui
gtDisplayValidityOn: aStream
	self isSuccess ifTrue: [ ^ self ].
	
	aStream nextPutAll: ' ['.
	self exampleException gtDisplayOn: aStream.
	aStream nextPutAll: ']'