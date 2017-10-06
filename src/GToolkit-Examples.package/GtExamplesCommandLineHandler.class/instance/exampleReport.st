private
exampleReport
	(self hasOption: 'junit-xml-output') ifTrue: [ ^ GtExamplesHDReport ].
	^ self error: 'only works for now for junit for now'