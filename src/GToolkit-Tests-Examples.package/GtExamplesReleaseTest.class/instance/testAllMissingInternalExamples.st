tests
testAllMissingInternalExamples
	<toBeDeprecated: #gtExample:>
	self assertIncludesPackages: { 'Glamour-'. 'GT-'. 'GToolkit-'. 'Moose-'. }
		excludedPackages: nil
		ignoredClasses: {
			ComposableModel. 
			GtExample. " skeleton object "
			GtExampleMethodAfter. " would require mocks "
			GTEventCollectors. 
			GTEventRecorder. 
			MetacelloVersionLoadDirective. " corrupt package detection "
			MorphicTreeNodeAdapter. " corrupt package detection "
			Slot. " corrupt package detection "
			ZnMessage. " corrupt package detection "
			GtExampleIcon. "abstract"
			GtExampleSubject. "abstract"
			CompiledCode. "abstract"
			TraitDescription.
		}
		pragmas: #( #spotterOrder: #gtInspectorPresentationOrder: )
		examples: #( #gtExample #gtExample: )
		description: 'All missing internal examples'