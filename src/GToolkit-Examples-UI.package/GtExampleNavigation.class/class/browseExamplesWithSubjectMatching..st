browse with scope
browseExamplesWithSubjectMatching: aGTExampleSubject
	" self browseAllExamplesWithSubject: GTExample "
	self browseExamples: 'Examples with subject "', aGTExampleSubject gtDisplayString, '"' select: [ :example | 
		example hasSubjectMatching: aGTExampleSubject ]