private
theClassDo: aBlock1 ifNone: aBlock2
	^ self theClass
		ifNotNil: [ :class | aBlock1 value: (self ensureClass: class) ]
		ifNil: aBlock2
	