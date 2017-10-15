testing
hasProblems
	^ problems notEmpty
			or: [  self hasValidAfter not
				or: [ self hasValidDependencies not ] ]