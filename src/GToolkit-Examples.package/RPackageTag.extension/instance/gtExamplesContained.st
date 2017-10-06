*GToolkit-Examples-Core
gtExamplesContained
	| examples |
	examples := OrderedCollection new.
	self package methods do: [ :method |
		examples addAll: method gtExamples ].
	^ examples