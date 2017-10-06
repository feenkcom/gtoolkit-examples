utils
assert: aGTExampleMethod class: aClass classNamed: aClassName meta: aBoolean selector: aSelector

	self assert: aGTExampleMethod methodClass == aClass.
	self assert: aGTExampleMethod methodClassName = aClassName.
	self assert: aGTExampleMethod meta = aBoolean.
	self assert: aGTExampleMethod selector = aSelector.
	self assert: aGTExampleMethod selector isSymbol.
	
	self assert: aGTExampleMethod exists.
	
	"self shouldnt: [ aGTExampleMethod resetStub ] raise: Exception.
	self assert: (aGTExampleMethod instVarNamed: 'methodClass') isNil."
	
	self assert: aGTExampleMethod methodClass == aClass.
	self assert: aGTExampleMethod methodClassName = aClassName.
	self assert: aGTExampleMethod meta = aBoolean.
	self assert: aGTExampleMethod selector = aSelector.
	self assert: aGTExampleMethod selector isSymbol.
	
	self assert: aGTExampleMethod exists.