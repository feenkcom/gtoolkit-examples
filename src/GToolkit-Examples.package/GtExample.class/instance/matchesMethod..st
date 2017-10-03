testing
matchesMethod: aCompiledMethod
	^ aCompiledMethod class = CompiledMethod
		and: [ self methodClass = aCompiledMethod methodClass
			and: [ self selector = aCompiledMethod selector ] ]