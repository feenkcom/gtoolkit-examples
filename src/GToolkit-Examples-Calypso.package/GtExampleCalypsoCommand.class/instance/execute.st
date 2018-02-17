execution
execute
	| examples |
	examples := selectedItems flatCollect: [ :each | (each getProperty: GtExampleProperty) examples ].
	examples
		ifNotEmpty: [ self executeOnExampleGroup: (GtExampleGroup new examples: examples) ]
		ifEmpty: [ self notifyNoExamples ]