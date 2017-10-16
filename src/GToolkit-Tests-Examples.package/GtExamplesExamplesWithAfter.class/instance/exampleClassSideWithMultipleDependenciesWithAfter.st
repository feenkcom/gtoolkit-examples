examples - class side
exampleClassSideWithMultipleDependenciesWithAfter
	<gtExample>
	| example returnedContext |
	
	example := (GtDummyExamplesWithAfterClassSide class >> #a) gtExample.
	self assertExample: example hasAfterMethod: (GtDummyExamplesWithAfterClassSide class >> #afterA).
	
	returnedContext := example run returnValue.
	self assert: (returnedContext includesKey: #a) not.
	self assert: (returnedContext includesKey: #a2).
	self assert: (returnedContext includesKey: #b) not.
	self assert: (returnedContext includesKey: #b2).
	self assert: (returnedContext includesKey: #c) not.
	self assert: (returnedContext includesKey: #c2).
	self assert: (returnedContext at: #execution) equals: { #afterA. #afterB. #afterC } asOrderedCollection.
	
	^ example