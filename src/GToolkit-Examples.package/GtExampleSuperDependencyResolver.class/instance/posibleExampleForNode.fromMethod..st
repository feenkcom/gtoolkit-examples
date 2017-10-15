action
posibleExampleForNode: aMessageNode fromMethod: aCompiledMethod
	| possibleExampleMethod |
	possibleExampleMethod := aCompiledMethod methodClass superclass lookupSelector: aMessageNode selector.
	^ self exampleFromMethod: possibleExampleMethod