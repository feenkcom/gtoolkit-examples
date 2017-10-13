testing
hasLiteralThorough: aLiteral
	^ self methodClass = aLiteral
		or: [ self selector = aLiteral
			or: [ (self label notNil and: [ self label includesSubstring: aLiteral asString caseSensitive: false ])
				or: [ (self description notNil and: [ self description includesSubstring: aLiteral asString caseSensitive: false ])
					or: [ (self subjects anySatisfy: [ :each | each hasLiteralThorough: aLiteral ])
						or: [ self exists and: [ self method hasLiteralThorough: aLiteral asSymbol ] ] ] ] ] ]