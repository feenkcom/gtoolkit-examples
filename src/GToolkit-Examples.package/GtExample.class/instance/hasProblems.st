testing
hasProblems
	self flag: 'Disabled the dependencies checks for now'.
	^ problems notEmpty
		"or: [ self hasValidArguments not"
			or: [  self hasValidAfter not
				or: [ self hasValidDependencies not ] ] "]"