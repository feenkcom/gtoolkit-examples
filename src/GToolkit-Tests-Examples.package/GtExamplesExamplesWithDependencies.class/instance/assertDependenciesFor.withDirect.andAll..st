asserting
assertDependenciesFor: anExample withDirect: expectedDirectDependencies andAll: expectedAllDependencies
	| obtainedDirectDependencies obtainedAllDependencies |
	
	obtainedDirectDependencies := anExample directDependencies.
	obtainedAllDependencies := anExample allDependencies.
	
	self assert: anExample isValid.
	self assert: anExample exists.
	self assert: obtainedDirectDependencies asArray equals: expectedDirectDependencies asArray.
	self assert: obtainedAllDependencies size equals: expectedAllDependencies size.
	self assertCollection: obtainedAllDependencies hasSameElements: expectedAllDependencies.
		