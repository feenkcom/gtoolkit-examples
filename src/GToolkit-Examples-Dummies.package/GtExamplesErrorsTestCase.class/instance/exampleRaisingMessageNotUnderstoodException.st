tests
exampleRaisingMessageNotUnderstoodException
	<gtExample>
	| example |
	
	example := (GtDummyExamplesInvalidDependencies class >> #a) gtExample.
	self assertDebuggingExample: example raises: MessageNotUnderstood.
	
	^ example