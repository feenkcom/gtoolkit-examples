*GToolkit-Examples-Extensions
gtExampleWorkingCopy
	<gtExample>
	<label: 'Metacello working-copy'>
	
	^ (RPackageOrganizer default packageOf: GtExample) mcPackage 
		ifNotNil: [ :mcp | mcp workingCopy ]