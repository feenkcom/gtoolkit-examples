tests
exampleRaisingAssertionFailedException
	<gtExample>
	<subjectClass: #GtExample>
	| example |
	
	example := (GtDummyExamplesWithExceptions class >> #e) gtExample.
	self assertDebuggingExample: example raises: AssertionFailure.
	
	^ example