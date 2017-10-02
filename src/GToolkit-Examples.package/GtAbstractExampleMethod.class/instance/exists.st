testing
exists
	^ self methodClassName notNil
		and: [ self methodClass notNil
			and: [ self methodClass includesSelector: self selector ] ]