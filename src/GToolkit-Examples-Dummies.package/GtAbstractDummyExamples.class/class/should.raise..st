asserting
should: aBlock raise: anExceptionalEvent 
	^self assert: (
		[aBlock value.
 		false] on: anExceptionalEvent
			do: [:ex | ex return: true])
			