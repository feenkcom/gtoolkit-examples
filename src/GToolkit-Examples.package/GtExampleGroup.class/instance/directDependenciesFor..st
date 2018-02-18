enumerating
directDependenciesFor: aGtExampleWithResult
	| dependencies |
	dependencies := aGtExampleWithResult directDependencies.
	^ dependencies collect: [ :eachGtExample | 
		self examples 
			detect: [ :eachGtExampleWithResult | 
				(eachGtExampleWithResult methodClass = eachGtExample methodClass)
					and: [ eachGtExampleWithResult selector = eachGtExample selector ] ]
			ifFound: [ :eachGtExampleWithResult | eachGtExampleWithResult ]
			ifNone: [ eachGtExample asExampleWithResult ] ].