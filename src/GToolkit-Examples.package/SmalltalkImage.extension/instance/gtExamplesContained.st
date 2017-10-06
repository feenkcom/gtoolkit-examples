*GToolkit-Examples-Core
gtExamplesContained
	| examples |
	examples := OrderedCollection new.
	self allClassesAndTraitsDo: [ :class |
		class gtExamplesFactory examplesDo: [ :example | 
			examples add: example ] ].
	^ examples