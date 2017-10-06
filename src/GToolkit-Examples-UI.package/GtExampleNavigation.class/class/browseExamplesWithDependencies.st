browse globally
browseExamplesWithDependencies
	" self browseAllExamplesWithDependencies "
	self browseExamples: 'Examples with dependencies' select: [ :example | 
		example hasArguments ]