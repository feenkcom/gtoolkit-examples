tests
testFromClassNamedSelector
	| exampleMethod |
	exampleMethod := GtExampleMethodAfter fromClassNamed: #GtExampleMethodAfter selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: #GtExampleMethodAfter meta: false selector: #gtSpotterGTExamplesFor:.
	
	exampleMethod := GtExampleMethodAfter fromClassNamed: 'GtExampleMethodAfter' selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: #GtExampleMethodAfter meta: false selector: #gtSpotterGTExamplesFor:.
	
	exampleMethod := GtExampleMethodAfter fromClassNamed: #GtExampleMethodAfter selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: 'GtExampleMethodAfter' meta: false selector: #gtSpotterGTExamplesFor:.