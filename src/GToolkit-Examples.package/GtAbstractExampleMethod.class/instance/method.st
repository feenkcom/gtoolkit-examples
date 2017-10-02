accessing-dynamic
method
	^ self exists 
		ifTrue: [ self methodClass >> self selector ]
		ifFalse: [ nil ]