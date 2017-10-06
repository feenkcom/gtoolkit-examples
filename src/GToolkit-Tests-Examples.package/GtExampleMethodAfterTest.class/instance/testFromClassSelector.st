tests
testFromClassSelector
	| exampleMethod |
	exampleMethod := GtExampleMethodAfter fromClass: GtExampleMethodAfter selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: #GtExampleMethodAfter meta: false selector: #gtSpotterGTExamplesFor:.
	self assert: exampleMethod class: GtExampleMethodAfter className: 'GtExampleMethodAfter' meta: false selector: #gtSpotterGTExamplesFor:.