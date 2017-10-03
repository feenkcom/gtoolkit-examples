private
handleDependencyErrorFor: anExample
	^ (GTExampleDependencyError new
		example: anExample;
		defined: anExample arguments;
		expected: anExample methodArgumentNames;
		invalid: anExample invalidArguments;
		yourself) signal