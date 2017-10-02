accessing-dynamic
provider 
	self exists ifFalse: [ ^ nil ].
	^ self methodClass isMeta
		ifTrue: [ self methodClass theNonMetaClass ]
		ifFalse: [ self methodClass theNonMetaClass new ]