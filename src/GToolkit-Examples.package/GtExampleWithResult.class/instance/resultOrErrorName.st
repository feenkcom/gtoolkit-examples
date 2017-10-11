printing
resultOrErrorName
	^ self hasResult
		ifTrue: [ self isSuccess
			ifTrue: [ self result returnValue class name asString ]
			ifFalse: [ (self isError or: [ self isFailure ])
				ifTrue: [ self result exampleException class name asString ]
				ifFalse: [ '' "if there was a problem" ] ] ]
		ifFalse: [ 'N/A' ]