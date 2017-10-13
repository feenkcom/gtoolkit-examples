private
exampleMethodsDo: aBlock
	self sourceClass theNonMetaClass methods
		select: [ :each | self isExampleMethod: each ]
		thenDo: aBlock.
	self sourceClass theMetaClass methods
		select: [ :each | self isExampleMethod: each ]
		thenDo: aBlock.
		