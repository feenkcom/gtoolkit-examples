tests
testAllExamples
	| examples |
	
	self timeLimit: 15 minutes.
	
	(examples := self allExamples)
		do: [ :exampleToTest | self checkAllPresentationsOf: exampleToTest returnValue ]
		displayingProgress: 'Running ', examples size asString, ' Examples for Inspector-Presentations'