private
processAfter: anExample withDependencies: exampleDependencies
	self processAfterMethodFor: anExample.
	exampleDependencies reversed do: [ :anotherExample |
		self processAfterMethodFor: anotherExample ]