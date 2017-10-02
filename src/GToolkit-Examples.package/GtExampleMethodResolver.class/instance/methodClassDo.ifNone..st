private
methodClassDo: aBlock1 ifNone: aBlock2
	^ self methodClass
		ifNotNil: [ :class | aBlock1 value: (self ensureClass: class) ]
		ifNil: aBlock2
	