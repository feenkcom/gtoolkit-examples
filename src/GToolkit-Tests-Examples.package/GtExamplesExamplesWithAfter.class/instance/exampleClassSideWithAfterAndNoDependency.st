examples - class side
exampleClassSideWithAfterAndNoDependency
	<gtExample>
	| example returnedContext |
	
	example := (GtDummyExamplesWithAfterClassSide class >> #c) gtExample.
	self assertExample: example hasAfterMethod: (GtDummyExamplesWithAfterClassSide class >> #afterC).
	
	returnedContext := example run returnValue.
	self assert: (returnedContext includesKey: #c) not.
	self assert: (returnedContext includesKey: #c2).
	self assert: (returnedContext at: #execution) equals: { #afterC } asOrderedCollection.
	
	^ example