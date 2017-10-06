utils
assert: aGTExampleMethod class: aClass className: aName meta: meta selector: aSelector 

	self assert: aGTExampleMethod methodClass == aClass.
	self assert: aGTExampleMethod methodClassName = aName.
	self assert: aGTExampleMethod meta = meta.
	self assert: aGTExampleMethod selector = aSelector.
	
	self assert: aGTExampleMethod exists.
	self assert: aGTExampleMethod isValid.
	
	"self shouldnt: [ aGTExampleMethod resetStub ] raise: Exception."
	"self assert: (aGTExampleMethod instVarNamed: 'methodClass') isNil."
	
	self assert: aGTExampleMethod methodClass == aClass.
	self assert: aGTExampleMethod methodClassName = aName.
	self assert: aGTExampleMethod meta = meta.
	self assert: aGTExampleMethod selector = aSelector.
	
	self assert: aGTExampleMethod exists.
	self assert: aGTExampleMethod isValid.