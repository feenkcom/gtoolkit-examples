utils
examplesInClasses: aSelector do: aBlock
	| classes examples |
	self shouldnt: [ classes  := (self perform: aSelector) ] raise: Error.
	self assert: classes notEmpty.
	classes do: [ :each |
		self shouldnt: [ examples := each gtExamples ] raise: Error.
		self assert: examples notEmpty.
		examples do: [ :example |
			self shouldnt: [ aBlock value: example ] raise: Error ] ]