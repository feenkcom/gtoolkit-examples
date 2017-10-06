browse with scope
browseAllExampleAfterMethods: aCollectionOfExamples
	" self browseAllExampleAfterMethods: GTExample "
	| env |
	env := RBSelectorEnvironment new.
	aCollectionOfExamples do: [ :example | 
		example after ifNotNil: [
			example after addToSelectorEnvironment: env ] ].
	^ env gtBrowseFor: 'After-methods'