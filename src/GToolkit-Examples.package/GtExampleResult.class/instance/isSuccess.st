testing
isSuccess
	^ self exampleException isNil
		and: [ self example hasProblems not ]