testing
hasLiteralThorough: aLiteral
	^ self methodClassName = aLiteral 
		or: [ self selector = aLiteral
			or: [ self exists 
				and: [ self method hasLiteralThorough: aLiteral ] ] ]