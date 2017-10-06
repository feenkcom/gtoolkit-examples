private
run: aCompiledMethod
	aCompiledMethod gtExample ifNotNil: [ :example | 
		example result ifNotNil: [ :result |
			result isSuccess 
				ifTrue: [ result returnValue inspect ]
				ifFalse: [ example debug ] ] ]