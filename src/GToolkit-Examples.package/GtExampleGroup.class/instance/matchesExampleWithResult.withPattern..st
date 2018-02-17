testing
matchesExampleWithResult: aGtExampleWithResult withPattern: patternString 
	^ aGtExampleWithResult example selector 
			includesSubstring: patternString caseSensitive: false 