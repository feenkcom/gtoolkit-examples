Extension { #name : #GtExampleInstanceSubject }

{ #category : #'*GToolkit-Examples-UI' }
GtExampleInstanceSubject >> forNautilus: aBlock [
	aBlock
		value: #'Inspect instance-subject "' ,  self instance gtDisplayString , '"'
		value: [ self instance inspect ]
]
