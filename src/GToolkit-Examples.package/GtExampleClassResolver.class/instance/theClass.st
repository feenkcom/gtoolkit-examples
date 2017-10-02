private
theClass
	^ self theClassName isClass 
		ifTrue: [ self theClassName ]
		ifFalse: [ Smalltalk classNamed: self theClassName asString ]