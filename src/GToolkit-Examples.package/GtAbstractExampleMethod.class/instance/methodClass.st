accessing
methodClass
	^ methodClass ifNil: [ methodClass := self resolveMethodClass ]
		