running
allExamples
	" IMPORTANT NOTICE 
	1) We expicitly exclude examples from Roassal and Woden. Running all of those examples at once will severely slow down all tests and eventually cause segmentation faults - crash of image. This is not a fault/bug of GTExample - it happens also if the GTExample-wrapper is not used at all ! "
	^ Smalltalk gtExamplesContained reject: [ :each | 
		each ignoreTest
			or: [ each ignoreTestReport
				or: [ { 'RT'. 'RW' } anySatisfy: [ :prefix | 
									each methodClass name beginsWith: prefix ] ] ] ]