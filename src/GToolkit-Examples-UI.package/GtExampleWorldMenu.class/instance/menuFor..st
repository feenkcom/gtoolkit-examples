public
menuFor: aBuilder
	self buildSubmenu: aBuilder.
	
	self inspectAllExamples: aBuilder.
	
	self buildSeparator.
	
	self browseAllExamplesWithProblems: aBuilder.
	self browseAllExamplesIgnoredByTests: aBuilder.