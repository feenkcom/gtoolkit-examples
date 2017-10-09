examples
b
	<gtExample>
	<label: 'Dummy #b'>
	<description: 'dependency missing / should pass as the exception is expected'>
	
	self should: [ self a1 ] raise: MessageNotUnderstood
	