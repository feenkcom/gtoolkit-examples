testing
hasValidDependencies
	| currentDependencies |
	currentDependencies := self dependenciesOrArguments.
	^  currentDependencies isEmpty 
			or: [ currentDependencies allSatisfy: #exists ]