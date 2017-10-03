testing
isSuccess
	^ self unexpectedError isNil
		and: [ self example isValid ]