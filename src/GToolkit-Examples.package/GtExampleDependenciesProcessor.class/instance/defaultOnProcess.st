accessing-defaults
defaultOnProcess
	^ [ :aProcessor :anExample | 
		aProcessor processDependenciesFor: anExample.
		aProcessor basicProcess: anExample ]