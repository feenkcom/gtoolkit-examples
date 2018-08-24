Extension { #name : #MCWorkingCopy }

{ #category : #'*GToolkit-Examples-Extensions' }
MCWorkingCopy class >> gtExampleWorkingCopy [
	<gtExample>
	<label: 'Metacello working-copy'>
	
	^ (RPackageOrganizer default packageOf: GtExample) mcPackage 
		ifNotNil: [ :mcp | mcp workingCopy ]
]
