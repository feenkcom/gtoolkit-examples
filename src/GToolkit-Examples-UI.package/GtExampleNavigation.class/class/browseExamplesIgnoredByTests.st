browse globally
browseExamplesIgnoredByTests
	" self browseAllExamplesIgnoredByTests "
	self browseExamples: 'Examples ignored by tests' select: [ :example | 
		example ignoreTest 
			or: [ example ignoreTestReport ] ]