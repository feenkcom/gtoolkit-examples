private
processDependenciesFor: anExample
	anExample dependenciesOrArguments do: [ :each | self process: each ]