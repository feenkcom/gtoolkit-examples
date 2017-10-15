testing
hasValidDependencies
	| currentDependencies |
	currentDependencies := self directDependencies.
	^  currentDependencies isEmpty 
			or: [ currentDependencies allSatisfy: #exists ]