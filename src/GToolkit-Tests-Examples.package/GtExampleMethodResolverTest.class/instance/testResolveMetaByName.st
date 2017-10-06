tests-convenience
testResolveMetaByName
	| method |
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: #GtExampleMethodResolver meta: true selector: #resolve:example:selector:.
	
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	
	method := GtExampleMethodResolver resolve: GtExampleMethodAfter example: nil className: 'GtExampleMethodResolver' meta: true selector: #resolve:example:selector:.
	
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.
	self assert: method class: GtExampleMethodResolver class classNamed: 'GtExampleMethodResolver class' meta: true selector: #resolve:example:selector:.