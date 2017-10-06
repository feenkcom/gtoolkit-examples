*GToolkit-Examples-UI
addToSelectorEnvironment: aSelectorEnvironment
	self exists ifFalse: [ ^ self ].
	
	aSelectorEnvironment addClass: self theClass