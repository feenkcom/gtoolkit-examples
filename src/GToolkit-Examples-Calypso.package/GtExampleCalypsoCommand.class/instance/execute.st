execution
execute
	| examples |
	examples := selectedItems flatCollect: [ :each | 
		"The property does not work as the collection is not updated on system changes."
		"(each getProperty: GtExampleProperty) examples"
		each actualObject gtExamplesContained ].
	examples
		ifNotEmpty: [ self executeOnExampleGroup: (GtExampleGroup new examples: examples) ]
		ifEmpty: [ self notifyNoExamples ]