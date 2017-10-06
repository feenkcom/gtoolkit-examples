private
inspectExample: aCompiledMethod
	aCompiledMethod gtExample 
		ifNotNil: [ :example | example inspect ]
		ifNil: [ self notifyNoExample: aCompiledMethod ]