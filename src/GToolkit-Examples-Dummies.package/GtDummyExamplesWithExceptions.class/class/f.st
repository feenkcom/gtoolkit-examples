examples 3
f
	<gtExample>
	<label: 'Dummy #f'>
	<description: 'Dummy #f, depends on #b which raises an expected exception'>
	
	self should: [ self assert: 1/0  ] raise: ZeroDivide