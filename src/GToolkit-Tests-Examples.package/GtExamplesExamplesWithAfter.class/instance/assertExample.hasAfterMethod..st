asserting
assertExample: anExample hasAfterMethod: aCompiledMethod

	self assert: anExample after notNil.
	self assert: anExample after exists.
	self assert: anExample after methodClassName equals: aCompiledMethod methodClass name.
	self assert: anExample after selector equals: aCompiledMethod selector.
	self assert: anExample after methodClass equals: aCompiledMethod methodClass.
	self assert: anExample after method equals: aCompiledMethod.