*GToolkit-Examples-UI
forNautilus: aBlock
	self exists ifFalse: [ ^ self ].
	
	aBlock 
		value: #'Browse class-subject "' ,  self theClassName , '"'
		value: [ self theClass browse ]
