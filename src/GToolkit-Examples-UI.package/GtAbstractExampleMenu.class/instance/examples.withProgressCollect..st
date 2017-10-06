utils
examples: aBlock1 withProgressCollect: aBlock2
	self examples: aBlock1 
		select: [ :each | true ] 
		collect: [ :each | aBlock2 value: each ] 
		progress: [ :examples | 'Processing ' , examples size asString , ' examples ...' ]