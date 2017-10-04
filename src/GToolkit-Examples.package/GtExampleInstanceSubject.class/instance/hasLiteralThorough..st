testing
hasLiteralThorough: aLiteral
	^ self exists
		and: [ self theClass methods anySatisfy: [ :method | 
			method selector = aLiteral
				or: [ 	method hasLiteralThorough: aLiteral ] ] ]