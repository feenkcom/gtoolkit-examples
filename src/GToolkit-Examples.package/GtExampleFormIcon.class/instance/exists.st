testing
exists
	^ self converter notNil
		and: [ (GtExampleMethodIcon includesSelector: self converter)
			and: [ self form notNil ] ]