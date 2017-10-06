printing
resultOrErrorClassName
	self hasResult
		ifTrue: [ self isSuccess
				ifTrue: [ ^ self result returnValue class name asString ]
				ifFalse: [ self isError
						ifTrue: [ self result unexpectedError ifNotNil: [ ^ self result unexpectedError class name asString ] ]
						ifFalse: [ self isFailure
								ifTrue: [ self result expectedError ifNotNil: [ ^ self result expectedError class name asString ] ] ] ] ]
		ifFalse: [ ^ 'N/A' ]