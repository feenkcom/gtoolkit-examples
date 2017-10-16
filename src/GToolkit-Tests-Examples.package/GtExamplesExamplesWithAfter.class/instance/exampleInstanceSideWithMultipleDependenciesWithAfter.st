examples - instance side
exampleInstanceSideWithMultipleDependenciesWithAfter
	<gtExample>
	| example returnedContext |
	
	example := (GtDummyExamplesWithAfterInstanceSide >> #a) gtExample.
	self assertExample: example hasAfterMethod: (GtDummyExamplesWithAfterInstanceSide >> #afterA).
	
	returnedContext := example run returnValue.
	self assert: (returnedContext includesKey: #a) not.
	self assert: (returnedContext includesKey: #a2).
	self assert: (returnedContext includesKey: #b) not.
	self assert: (returnedContext includesKey: #b2).
	self assert: (returnedContext includesKey: #c) not.
	self assert: (returnedContext includesKey: #c2).
	self assert: (returnedContext at: #execution) equals: { #afterA. #afterB. #afterC } asOrderedCollection.
	self assert: (returnedContext at: #self) afterExecution equals: { #afterA. #afterB. #afterC } asOrderedCollection.
	
	^ example