tests
testAllMissingExternalExamples
	<toBeDeprecated: #gtExample:>
	self assertIncludesPackages: nil
		excludedPackages: { 'Glamour-'. 'GT-'. 'GToolkit-'. 'Moose-'. 'Petit'. 'Renraku'. 'Slot'. 'Opal'. 'Roassal' }
		ignoredClasses: { }
		pragmas: #( #spotterOrder: #gtInspectorPresentationOrder: )
		examples: #( #gtExample #gtExample: )
		description: 'All missing external examples'