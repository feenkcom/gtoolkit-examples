item decoration
decorateBrowserItem: anItem ofClass: aClass
	| examples |
	examples := self examplesFor: aClass.
	self traceCr: examples.
	examples ifEmpty: [ ^ self ].
	self traceCr: aClass.
	anItem addProperty: (GtExampleProperty examples: examples)