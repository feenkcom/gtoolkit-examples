browse with scope
browseExamplesWithSubject: aGTExampleSubject
	" self browseAllExamplesWithSubject: GTExample "
	self browseExamples: 'Examples with subject "', aGTExampleSubject gtDisplayString, '"' select: [ :example | 
		example hasSubject: aGTExampleSubject ]