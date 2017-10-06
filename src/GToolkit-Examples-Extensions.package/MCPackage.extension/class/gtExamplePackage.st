*GToolkit-Examples-Extensions
gtExamplePackage
	<gtExample>
	<label: 'Metacello package with corresponding RPackage'>
	
	MCWorkingCopy allManagers do: [ :each | 
		each packageName = 'GT-Examples' ifTrue: [ ^ each package ] ].
	^ nil