browse with scope
browseExamplesLiteralThorough: aString
	" self browseExamplesLiteralThorough: #and: "
	self browseExamples: 'Examples with literal "', aString, '"' select: [ :example | 
		example hasLiteralThorough: aString ]