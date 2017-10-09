examples 2
d
	<gtExample>
	<label: 'Dummy #d'>
	<description: 'Dummy #d, raises AssertionFailure'>
	
	self should: [ self assert: false ] raise: AssertionFailure