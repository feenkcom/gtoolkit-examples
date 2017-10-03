testing
hasProblems
	^ self example hasProblems
		or: [ self isFailure
			or: [ self isError ] ]