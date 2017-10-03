testing
isError
	^ self isSuccess not
		and: [ self isUnexpectedError
			and: [ self unexpectedError isGTExampleError ] ]