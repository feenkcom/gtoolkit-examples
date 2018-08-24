Extension { #name : #GtAbstractExampleMethod }

{ #category : #'*GToolkit-Examples-UI' }
GtAbstractExampleMethod >> addToSelectorEnvironment: aSelectorEnvironment [
	self exists ifFalse: [ ^ self ].
	
	aSelectorEnvironment addClass: self methodClass selector: self selector
]

{ #category : #'*GToolkit-Examples-UI' }
GtAbstractExampleMethod >> forNautilus: aBlock [
	self exists ifFalse: [ ^ self ].
	
	aBlock
		value: #'Browse method "' ,  self method gtDisplayString , '"'
		value: [ self method browse ]
]
