accessing-dynamic
form
	^ self exists
		ifTrue: [ self basicForm ]
		ifFalse: [ nil ]