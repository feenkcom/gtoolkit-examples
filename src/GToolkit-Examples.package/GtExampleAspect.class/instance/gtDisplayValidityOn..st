ui
gtDisplayValidityOn: aStream
	self isValid ifTrue: [ ^ self ].
	
	self exists ifFalse: [ ^ aStream nextPutAll: ' [does not exist]' ].
	aStream nextPutAll: ' [invalid]'