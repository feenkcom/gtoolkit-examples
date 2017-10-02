private
methodClass
	^ self methodClassName isClass 
		ifTrue: [ self methodClassName ]
		ifFalse: [ Smalltalk classNamed: self methodClassName asString ]