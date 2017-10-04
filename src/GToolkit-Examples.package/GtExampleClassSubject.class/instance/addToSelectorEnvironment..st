as yet unclassified
addToSelectorEnvironment: aSelectorEnvironment
	self exists ifFalse: [ ^ self ].
	
	aSelectorEnvironment addClass: self theClass