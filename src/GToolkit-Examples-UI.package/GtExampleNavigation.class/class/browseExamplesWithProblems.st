browse globally
browseExamplesWithProblems
	" self browseExamplesWithProblems "
	self browseExamples: 'Examples with problems' select: [ :example | 
		example hasProblems ]