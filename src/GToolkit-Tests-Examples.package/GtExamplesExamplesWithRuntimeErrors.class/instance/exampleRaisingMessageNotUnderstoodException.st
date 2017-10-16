tests
exampleRaisingMessageNotUnderstoodException
	<gtExample>
	<subjectClass: #GtExample>
	| example |
	
	example := (GtDummyExamplesInvalidDependencies class >> #a) gtExample.
	self assertDebuggingExample: example raises: MessageNotUnderstood.
	
	^ example