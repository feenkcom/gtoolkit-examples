tests
testNoExampleInstances

	self assert: GtExample allSubInstances size equals: 0.
	self assert: GtExampleResult allSubInstances size equals: 0.
	