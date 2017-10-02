actions
resolve
	^ self methodClassDo: [ :class | self resolveByClass: class ] 
		ifNone: [ self resolveByName ]