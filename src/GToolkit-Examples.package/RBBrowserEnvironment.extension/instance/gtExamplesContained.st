*GToolkit-Examples-Core
gtExamplesContained
	| examples |
	examples := OrderedCollection new.
	self methodsDo: [ :each | 
		each isGTExampleMethod ifTrue: [ 
			each gtExample ifNotNil: [ :example | 
				examples add: example ] ] ].
	^ examples