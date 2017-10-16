tests
exampleRaisingZeroDivideException
	<gtExample>
	<subjectClass: #GtExample>
	| example |
	
	example := (GtDummyExamplesWithExceptions class >> #j) gtExample.
	self assertDebuggingExample: example raises: ZeroDivide.
	
	^ example