action
posibleExampleForNode: aMessageNode fromMethod: aCompiledMethod
	| possibleExampleMethod |
	possibleExampleMethod := aCompiledMethod methodClass lookupSelector: aMessageNode selector.
	^ self exampleFromMethod: possibleExampleMethod