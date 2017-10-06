private
browseAllExampleSubjects: aCollectionOfExamples
	" self browseAllExamplesWithSubject: GTExample "
	| env |
	env := RBSelectorEnvironment new.
	aCollectionOfExamples do: [ :example | 
		example subjects do: [ :subject | 
			subject ifNotNil: [ 
				subject addToSelectorEnvironment: env ] ] ].
	^ env gtBrowseFor: 'Subjects'