ui
icon
	self isSuccess ifTrue: [ ^ ThemeIcons current iconNamed: #testGreen ].
	(self isError or: [ self isFailure ]) ifTrue: [ ^ ThemeIcons current iconNamed: #testRed ].
	^ ThemeIcons current iconNamed: #testNotRun