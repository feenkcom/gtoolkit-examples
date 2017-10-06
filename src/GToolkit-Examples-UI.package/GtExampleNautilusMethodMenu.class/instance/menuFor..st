public
menuFor: aBuilder
	| model method examples |
	(model := aBuilder model) ifNil: [ ^ self ].
	(method := model selectedMethod) ifNil: [ ^ self ].
	examples := method gtExamples reject: [ :each | each isNil ].
	
	self buildSubmenu: aBuilder.
	examples ifNotEmpty: [ 
		| problems arguments subjects afters |
		problems := (examples gather: [ :each | each problems ]) reject: [ :each | each isNil ].
		arguments := (examples gather: [ :each | each arguments ]) reject: [ :each | each isNil ].
		afters := (examples collect: [ :each | each after ]) reject: [ :each | each isNil ].
		subjects := (examples gather: [ :each | each subjects ]) reject: [ :each | each isNil ].
		self inspectExamples: [ examples ] builder: aBuilder.
		self inspectReturnValue: [ examples ] builder: aBuilder.
		problems ifNotEmpty: [
			self inspectProblems: [ examples ] builder: aBuilder.
			self buildSeparator ].
		self buildSeparator.
		self runExamples: [ examples ] builder: aBuilder.
		self debugExamples: [ examples ] builder: aBuilder ]