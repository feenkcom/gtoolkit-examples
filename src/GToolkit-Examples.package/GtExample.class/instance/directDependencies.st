accessing-dynamic
directDependencies
	"I return the list of examples directly used within this example. The returned order is the one in which 
	method calls denoting a dependency are present within the method defining this example. If an example is
	reference multiple time I include it only once."
	^ self dependencyResolverClass resolveDependenciesForExample: self