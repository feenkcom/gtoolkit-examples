tests
exampleRaisingZeroDivideException
	<gtExample>
	| example |
	
	example := (GtDummyExamplesWithExceptions class >> #j) gtExample.
	self assertDebuggingExample: example raises: ZeroDivide.
	
	^ example