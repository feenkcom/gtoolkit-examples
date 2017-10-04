accessing
theClass: anObject
	anObject ifNotNil: [ self theClassName: anObject name ].
	theClass := anObject.
	