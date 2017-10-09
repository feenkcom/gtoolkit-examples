testing
isFailure
	^ self isSuccess not
		and: [ self hasException
			and: [ self exampleException isKindOf: AssertionFailure ] ]