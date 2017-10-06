tests-convenience
testResolveMetaByNameWithSystemCompatibility
	| method |
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: 'GtExampleMethodResolver class' meta: false selector: 'resolve:example:selector:'.
	
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.