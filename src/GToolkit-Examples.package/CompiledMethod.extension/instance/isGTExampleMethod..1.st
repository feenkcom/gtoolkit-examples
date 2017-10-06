*GToolkit-Examples-Core
isGTExampleMethod
	^ self pragmas anySatisfy: [ :each | each isGTExamplePragma ]