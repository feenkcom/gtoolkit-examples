item decoration
decorateBrowserItem: anItem ofClass: aClass
	| examples |
	examples := self examplesFor: aClass.
	examples ifEmpty: [ ^ self ].
	anItem addProperty: (GtExampleProperty examples: examples)