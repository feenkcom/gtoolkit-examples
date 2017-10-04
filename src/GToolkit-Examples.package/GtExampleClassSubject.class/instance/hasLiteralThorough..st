testing
hasLiteralThorough: aLiteral
	^ self theClassName = aLiteral
		or: [ self exists 
			and: [ self theClass = aLiteral ] ]