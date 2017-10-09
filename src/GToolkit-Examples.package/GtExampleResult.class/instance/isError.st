testing
isError
	^ self isSuccess not
		and: [ self hasException
			and: [ (self exampleException isKindOf: AssertionFailure) not ] ]