examples - result
exampleResultWithAssertionFailedException
	<gtExample>
	<subjectClass: #GtExampleResult>
	| result |
	
	result := self exampleRaisingAssertionFailedException run.
	self assertExpectedFailureFor: result.
	
	^ result