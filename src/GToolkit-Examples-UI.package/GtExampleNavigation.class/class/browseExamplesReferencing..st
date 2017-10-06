browse with scope
browseExamplesReferencing: aLiteral
	" self browseAllExamplesReferencing: #and: "
	self browseExamples: 'Examples referencing "', aLiteral asString, '"' select: [ :example | 
		example isReferencing: aLiteral ]