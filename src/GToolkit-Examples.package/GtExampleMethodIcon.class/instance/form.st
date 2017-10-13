accessing-dynamic
form
	"I return the icon created by the associated method."
	^ self exists
		ifTrue: [ self basicForm ]
		ifFalse: [ nil ]