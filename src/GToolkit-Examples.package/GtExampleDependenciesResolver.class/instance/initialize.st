initialization
initialize
	super initialize.
	resolvers := { 
		GtExampleSelfDependencyResolver new .
		GtExampleSuperDependencyResolver new .
		GtExampleExternalDependencyResolver new }