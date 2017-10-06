tests
testGlobals
	| globals |
	(globals := { Smalltalk . RBMessageNode . Trait . TClass . TBehavior . GTInspector . Object . Class . CompiledMethod })
		do: [ :each | self checkAllPresentationsOf: each ]
		displayingProgress: 'Running ', globals size asString, ' globals for Inspector-Presentations'