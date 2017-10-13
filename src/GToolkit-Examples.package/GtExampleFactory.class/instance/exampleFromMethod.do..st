private
exampleFromMethod: aCompiledMethod do: aBlock
	aBlock value: (self createExample: aCompiledMethod)