private
handleDependencyErrorFor: anExample
	^ (GtExampleDependencyError new
		example: anExample;
		defined: anExample arguments;
		expected: anExample methodArgumentNames;
		invalid: #();
		yourself) signal