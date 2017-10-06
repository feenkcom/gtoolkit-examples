tests
testMissingGTInspectorExamples
	<toBeDeprecated: #gtExample:>
	self assertIncludesPackages: { 'GT-Inspector' }
		excludedPackages: nil
		ignoredClasses: {
			ComposableModel. " abstract superclass "
			MetacelloVersionLoadDirective. " corrupt package detection "
			MorphicTreeNodeAdapter. " corrupt package detection "
			ZnMessage. " abstract factory & superclass / subclasses provide examples "
			CompiledCode. "abstract"
		}
		pragmas: #( #gtInspectorPresentationOrder: )
		examples: #( #gtExample #gtExample: )
		description: 'Missing examples for GTInspector'