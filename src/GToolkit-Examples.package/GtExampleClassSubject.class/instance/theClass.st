accessing
theClass
	^ theClass ifNil: [ theClass := self resolveClass ]
		