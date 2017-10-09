tests
exampleResultWithAssertionFailedException
	<gtExample>
	| result |
	
	result := self exampleRaisingAssertionFailedException run.
	self assertExpectedFailureFor: result.
	
	^ result