examples - instance side
exampleInstanceSideWithAfterAndNoDependency
	<gtExample>
	| example returnedContext |
	
	example := (GtDummyExamplesWithAfterInstanceSide >> #c) gtExample.
	self assertExample: example hasAfterMethod: (GtDummyExamplesWithAfterInstanceSide >> #afterC).
	
	returnedContext := example run returnValue.
	self assert: (returnedContext includesKey: #c) not.
	self assert: (returnedContext includesKey: #c2).
	self assert: (returnedContext at: #execution) equals: { #afterC } asOrderedCollection.
	self assert: (returnedContext at: #self) afterExecution equals: { #afterC } asOrderedCollection.
	
	^ example