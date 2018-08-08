accessing
currentAction
	^ CurrentAction ifNil: [ CurrentAction := GtExampleNautilusActionButton ]