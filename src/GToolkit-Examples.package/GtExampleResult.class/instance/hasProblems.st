testing
hasProblems
	^ self example hasProblems
		or: [ self hasException ]