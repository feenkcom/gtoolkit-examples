I provide the basic logic for traversing over the dependencies of an example.  By default I traverse first the dependencies of an example before traversing the actual node. 

#processExampleFirst - Change the traversal logic so that an example is visited before its dependencies
#onProcess: - Provides a block that determines how the examples and its dependencies are visited