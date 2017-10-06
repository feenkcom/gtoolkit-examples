printing
statusText
	self hasResult
		ifTrue: [ self isSuccess
				ifTrue: [ ^ 'Success' ]
				ifFalse: [ self isError
						ifTrue: [ ^ 'Error' ].
					self isFailure
						ifTrue: [ ^ 'Failure' ] ] ]
		ifFalse: [ ^ 'N/A' ]