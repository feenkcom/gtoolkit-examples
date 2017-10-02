testing
matchesMethod: aCompiledMethod
	^ self exists
		and: [ self methodClass = aCompiledMethod methodClass
			and: [ self selector = aCompiledMethod selector ] ]