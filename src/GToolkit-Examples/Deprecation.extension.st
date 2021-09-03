Extension { #name : 'Deprecation' }

{ #category : '*GToolkit-Examples' }
Deprecation >> freeze [
	super freeze.
	context := context copyTo: thisContext.
]
