tests
testAllMissingInternalExamples
	<toBeDeprecated: #gtExample:>
	self assertIncludesPackages: { 'Glamour-'. 'GT-'. 'GToolkit-'. 'Moose-'. }
		excludedPackages: nil
		ignoredClasses: {
			ComposableModel. 
			GTExample. " skeleton object "
			GTExampleMethodAfter. " would require mocks "
			GTEventCollectors. 
			GTEventRecorder. 
			MetacelloVersionLoadDirective. " corrupt package detection "
			MorphicTreeNodeAdapter. " corrupt package detection "
			Slot. " corrupt package detection "
			ZnMessage. " corrupt package detection "
			GTExampleIcon. "abstract"
			GTExampleSubject. "abstract"
			CompiledCode. "abstract"
		}
		pragmas: #( #spotterOrder: #gtInspectorPresentationOrder: )
		examples: #( #gtExample #gtExample: )
		description: 'All missing internal examples'