private
buildDependencies: anExampleOrMethod1 at: index parent: anExampleOrMethod2
	self process: anExampleOrMethod1 
		do: [ 
			anExampleOrMethod1 isGTExample 
				ifTrue: [ 
					" example with all dependencies "
					self buildDependency: anExampleOrMethod1 at: index parent: anExampleOrMethod2.
					anExampleOrMethod1 dependenciesOrArguments withIndexDo: [ :dep :depIndex | 
						self buildDependencies: dep at: depIndex parent: anExampleOrMethod1 ].
					self buildAfter: anExampleOrMethod1 ]
				ifFalse: [ 
					" just an argument (placeholder) - example missing "
					self buildArgument: anExampleOrMethod1 at: index parent: anExampleOrMethod2 ] ] 
		onRecursionDo: [ 
			self updateDependency: anExampleOrMethod1 at: index parent: anExampleOrMethod2 ]
