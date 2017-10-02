actions
resolve
	^ self theClassDo: [ :class | self resolveByClass: class ]
		ifNone: [ self resolveByName ]