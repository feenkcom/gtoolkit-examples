action
posibleExampleForNode: aGlobalNode fromMethod: aCompiledMethod
	| possibleExampleMethod |
	possibleExampleMethod := (Smalltalk classNamed: aGlobalNode name) 
		lookupSelector: aGlobalNode parent parent selector.
	^ self exampleFromMethod: possibleExampleMethod