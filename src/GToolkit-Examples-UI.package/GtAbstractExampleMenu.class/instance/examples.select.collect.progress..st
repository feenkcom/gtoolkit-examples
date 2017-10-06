utils
examples: aBlock1 select: aBlock2 collect: aBlock3 progress: aBlock4
	| results |
	results := Dictionary new.
	self examples: (aBlock1 value select: [ :each | each isGTExample and: [ aBlock2 value: each ] ]) 
		do: [ :each | results at: each put: (aBlock3 value: each) ]
		progress: aBlock4.
	results
		ifNotEmpty: [ 
			(results size = 1
				ifTrue: [ results anyOne ]
				ifFalse: [ results ]) inspect ]
		ifEmpty: [ self notifyNoExamples ]