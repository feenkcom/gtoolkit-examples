private
inspectReturnValue: aCompiledMethod
	aCompiledMethod gtExample 
		ifNotNil: [ :example | 
			example result 
				ifNotNil: [ :exampleResult |
					exampleResult isSuccess 
						ifTrue: [ result returnValue inspect ]
						ifFalse: [ example debug ] ] ]
		ifNil: [ self notifyNoExample: aCompiledMethod ]