accessing-dynamic
methodArgumentNames
	^ self exists
		ifTrue: [ self method argumentNames ]
		ifFalse: [ #() ]