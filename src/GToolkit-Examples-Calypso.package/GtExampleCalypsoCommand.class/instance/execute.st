execution
execute
	| examples |
	examples := selectedItems flatCollect: [ :each | each actualObject gtExamplesContained ].
	examples
		ifNotEmpty: [ self executeOnExampleGroup: (GtExampleGroup new examples: examples) ]
		ifEmpty: [ self notifyNoExamples ]