tests
exampleResultWithZeroDivideException
	<gtExample>
	| result |
	
	result := self exampleRaisingZeroDivideException run.
	self 
		assertExpectedErrorFor: result 
		ofClass: ZeroDivide 
		withMessage: ''.
	
	^ result