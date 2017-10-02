converting
processExampleFirst
	self onProcess: [ :aProcessor :anExample | 
		aProcessor basicProcess: anExample.
		aProcessor processDependenciesFor: anExample ]