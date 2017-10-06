*GToolkit-Examples-UI
forNautilus: aBlock
	self exists ifFalse: [ ^ self ].
	
	aBlock
		value: #'Browse method "' ,  self method gtDisplayString , '"'
		value: [ self method browse ]