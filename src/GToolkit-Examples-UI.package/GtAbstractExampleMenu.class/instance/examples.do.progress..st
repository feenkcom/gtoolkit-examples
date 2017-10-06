utils
examples: aCollection do: aBlock1 progress: aBlock2
	| progress |
	aCollection size < 2 ifTrue: [ ^ aCollection do: aBlock1 ].
	aBlock2 ifNil: [ ^ aCollection do: aBlock1 ].
	(progress := aBlock2 value: aCollection) isEmptyOrNil ifTrue: [ ^ aCollection do: aBlock1 ].
	aCollection do: aBlock1 displayingProgress: progress