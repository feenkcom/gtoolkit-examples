testing
hasValidAfter
	^ self hasAfter not
		or: [ self after isValid ]