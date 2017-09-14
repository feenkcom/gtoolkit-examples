PRAGMA-SELECTORS
raises: aClassName
	<gtExamplePragma>
	<description: 'This example is expected to raise the given exception. The example (as a test) will fail if the exception is not raised.'>
	self exceptions add: aClassName asSymbol asClass