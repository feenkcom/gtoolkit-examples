Extension { #name : #Deprecation }

{ #category : #'*GToolkit-Examples' }
Deprecation >> freeze [
	<gtPharoPatch: #Pharo>
	
	super freeze.
	context := context copyTo: thisContext.
]
