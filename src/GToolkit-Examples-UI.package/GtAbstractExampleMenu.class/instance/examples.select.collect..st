utils
examples: aBlock1 select: aBlock2 collect: aBlock3
	| examples |
	examples := Dictionary new.
	aBlock1 value 
		select: [ :each | each isGTExample and: [ aBlock2 value: each ] ] 
		thenDo: [ :each | examples at: each put: (aBlock3 value: each) ].
	examples
		ifNotEmpty: [ examples inspect ]
		ifEmpty: [ self notifyNoExamples ]