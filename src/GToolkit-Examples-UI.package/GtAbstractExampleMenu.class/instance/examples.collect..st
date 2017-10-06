utils
examples: aBlock1 collect: aBlock2
	self examples: aBlock1 select: [ :each | true ] collect: [ :each | aBlock2 value: each ]