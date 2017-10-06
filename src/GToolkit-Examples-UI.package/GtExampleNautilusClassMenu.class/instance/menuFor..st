public
menuFor: aBuilder
	| model class |
	(model := aBuilder model) ifNil: [ ^ self ].
	(class := model selectedClass) ifNil: [ ^ self ].
	
	self buildSubmenu: aBuilder.
	self inspectExamples: [ class gtExamples ] builder: aBuilder.
	self inspectReturnValue: [ class gtExamples ] builder: aBuilder.
	self inspectProblems: [ class gtExamples ] builder: aBuilder.
	self buildSeparator.
	self runExamples: [ class gtExamples ] builder: aBuilder.
	self debugExamples: [ class gtExamples ] builder: aBuilder.
	self buildSeparator.
	self browseClass: class builder: aBuilder.
	self browseSubclassesOf: class builder: aBuilder.
	self browseSuperclassesOf: class builder: aBuilder.
	self browseHierarchyOf: class builder: aBuilder