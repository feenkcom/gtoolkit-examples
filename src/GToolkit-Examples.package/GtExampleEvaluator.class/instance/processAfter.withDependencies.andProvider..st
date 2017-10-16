private
processAfter: anExample withDependencies: exampleDependencies andProvider: aProvider
	self processAfterMethodFor: anExample withProvider: aProvider.
	exampleDependencies reversed do: [ :anotherExample |
		self processAfterMethodFor: anotherExample withProvider: aProvider ]