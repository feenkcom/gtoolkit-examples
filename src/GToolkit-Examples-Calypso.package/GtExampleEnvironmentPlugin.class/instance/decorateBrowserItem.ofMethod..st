item decoration
decorateBrowserItem: anItem ofMethod: aMethod
	| examples |
	examples := self examplesFor: aMethod.
	examples ifEmpty: [ ^ self ].
	anItem addProperty: (GtExampleProperty examples: examples)