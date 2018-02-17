item decoration
decorateBrowserItem: anItem ofPackage: aPackage
	| examples |
	examples := self examplesFor: aPackage.
	examples ifEmpty: [ ^ self ].
	anItem addProperty: (GtExampleProperty examples: examples)