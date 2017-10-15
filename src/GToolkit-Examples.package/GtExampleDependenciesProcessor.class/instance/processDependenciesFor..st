private
processDependenciesFor: anExample
	anExample directDependencies do: [ :each | self process: each ]