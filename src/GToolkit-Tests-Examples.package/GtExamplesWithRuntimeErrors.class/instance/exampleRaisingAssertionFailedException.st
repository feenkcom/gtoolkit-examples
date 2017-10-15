tests
exampleRaisingAssertionFailedException
	<gtExample>
	| example |
	
	example := (GtDummyExamplesWithExceptions class >> #e) gtExample.
	self assertDebuggingExample: example raises: AssertionFailure.
	
	^ example