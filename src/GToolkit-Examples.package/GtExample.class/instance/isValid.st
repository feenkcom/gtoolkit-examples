testing
isValid
	^ self hasProblems not
		and: [ self traverser canProcess ]