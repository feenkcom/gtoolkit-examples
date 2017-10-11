asserting
assertClass: aClassOrClassName meta: aBoolean resolvedAsClass: aClass 
	(GtExampleMethodResolver new 
		methodClassName: aClassOrClassName;
		meta: aBoolean;
		yourself) methodClassDo: [ :class | self assert: class == aClass ] ifNone: [ self assert: aClass isNil ].
	(GtExampleClassResolver new 
		theClassName: aClassOrClassName;
		meta: aBoolean;
		yourself) theClassDo: [ :class | self assert: class == aClass ] ifNone: [ self assert: aClass isNil ]