I know how to extract the dependencies of a given example. The dependencies of a given example consists in message sends to other method constructing an example. 

To determine if a message send represents a dependency to a method containing an example, I use heuristic defined by subclasses of ==GtExampleDependencyResolver==. 
