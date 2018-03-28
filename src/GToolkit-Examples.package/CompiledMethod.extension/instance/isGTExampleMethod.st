*GToolkit-Examples-Core
isGTExampleMethod

	"Spy2 changes the AST of the method and removes pragmas.
	Therefore we need to ask an original method instead"
	((self respondsTo: #isSpy)
		and: [ self isSpy ])
			ifTrue: [ ^ self originalMethod isGTExampleMethod ].

	^ (self pragmas anySatisfy: [ :each | each isGTExamplePragma ])
		and: [ self numArgs = 0 ]