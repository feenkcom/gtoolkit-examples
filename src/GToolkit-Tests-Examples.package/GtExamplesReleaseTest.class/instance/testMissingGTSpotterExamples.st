tests
testMissingGTSpotterExamples
	<toBeDeprecated: #gtExample:>
	self assertIncludesPackages: { 'GT-Spotter' }
		excludedPackages: nil
		ignoredClasses: { 
			Slot. " abstract "
		}
		pragmas: #( #spotterOrder: )
		examples: #( #gtExample #gtExample: )
		description: 'Missing examples for GTSpotter'