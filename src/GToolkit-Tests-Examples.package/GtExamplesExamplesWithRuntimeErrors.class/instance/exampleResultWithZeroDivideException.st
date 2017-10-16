examples - result
exampleResultWithZeroDivideException
	<gtExample>
	<subjectClass: #GtExampleResult>
	| result |
	
	result := self exampleRaisingZeroDivideException run.
	self 
		assertExpectedErrorFor: result 
		ofClass: ZeroDivide 
		withMessage: ''.
	
	^ result