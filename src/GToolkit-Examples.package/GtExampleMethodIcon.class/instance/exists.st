testing
exists
	^ super exists
		and: [ self converter notNil
			and: [ self class class includesSelector: self converter ] ]