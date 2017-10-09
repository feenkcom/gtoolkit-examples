examples 3
h
	<gtExample>
	<label: 'Dummy #h'>
	<description: 'Dummy #h,  does not raise exception'>
	<noTest>
	
	self assert: true. " no exception raised -> expected exception not raises"
	true " no exception raised -> expected exception not raises "
		ifTrue: [ ^ 1 ] 
		ifFalse: [ 1/0 ]