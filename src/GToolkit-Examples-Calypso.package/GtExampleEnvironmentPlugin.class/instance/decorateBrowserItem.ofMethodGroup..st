item decoration
decorateBrowserItem: anItem ofMethodGroup: aMethodGroup
	| examples |
	aMethodGroup class isBasedOnMethodTag ifFalse: [ ^ self ].
	examples := aMethodGroup methods flatCollect: [ :eachMethod | self examplesFor: eachMethod ].
	examples ifEmpty: [ ^ self ].
	anItem addProperty: (GtExampleProperty examples: examples)