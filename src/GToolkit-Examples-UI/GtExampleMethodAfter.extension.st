Extension { #name : #GtExampleMethodAfter }

{ #category : #'*GToolkit-Examples-UI' }
GtExampleMethodAfter >> forNautilus: aBlock [
	self exists ifFalse: [ ^ self ].
	
	aBlock
		value: #'Browse after-method "' ,  self method gtDisplayString , '"'
		value: [ self method browse ]
]
