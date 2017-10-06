tests-convenience
testResolveByName
	| method |
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: #GtExampleMethodResolver meta: false selector: #selector.
	
	self assert: method class: GtExampleMethodResolver classNamed: #GtExampleMethodResolver meta: false selector: #selector.
	self assert: method class: GtExampleMethodResolver classNamed: 'GtExampleMethodResolver' meta: false selector: #selector.
	
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: 'GtExampleMethodResolver' meta: false selector: 'selector'.
	
	self assert: method class: GtExampleMethodResolver classNamed: #GtExampleMethodResolver meta: false selector: #selector.
	self assert: method class: GtExampleMethodResolver classNamed: 'GtExampleMethodResolver' meta: false selector: #selector.