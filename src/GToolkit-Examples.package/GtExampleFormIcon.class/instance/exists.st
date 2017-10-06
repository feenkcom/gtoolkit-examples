testing
exists
	^ self converter notNil
		and: [ (GTExampleMethodIcon includesSelector: self converter)
			and: [ self form notNil ] ]