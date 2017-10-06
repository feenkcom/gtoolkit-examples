accessing
form
	^ self exists
		ifTrue: [ self basicForm ]
		ifFalse: [ nil ]