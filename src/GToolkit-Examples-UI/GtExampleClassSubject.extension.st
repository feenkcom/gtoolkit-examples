Extension { #name : #GtExampleClassSubject }

{ #category : #'*GToolkit-Examples-UI' }
GtExampleClassSubject >> addToSelectorEnvironment: aSelectorEnvironment [
	self exists ifFalse: [ ^ self ].
	
	aSelectorEnvironment addClass: self theClass
]

{ #category : #'*GToolkit-Examples-UI' }
GtExampleClassSubject >> forNautilus: aBlock [
	self exists ifFalse: [ ^ self ].
	
	aBlock 
		value: #'Browse class-subject "' ,  self theClassName , '"'
		value: [ self theClass browse ]

]
