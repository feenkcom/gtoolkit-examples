initialization
initialize
	super initialize.
	
	self processDependenciesFirst.
	processing := IdentitySet new.