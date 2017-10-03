converting
processDependenciesFirst
	self onProcess: [ :aProcessor :anExample | 
		aProcessor processDependenciesFor: anExample.
		aProcessor basicProcess: anExample ]