running
runPackage: aString
	^ self new 
		initializeExamples: (RPackage organizer packageNamed: aString) gtExamplesContained 
		entitled: aString;
		run