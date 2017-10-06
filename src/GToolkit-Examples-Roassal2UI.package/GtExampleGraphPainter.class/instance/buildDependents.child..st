private
buildDependents: anExampleOrMethod1 child: anExampleOrMethod2
	self process: anExampleOrMethod1 
		do: [ 
			anExampleOrMethod1 directDependents do: [ :dep |
				self buildDependent: dep child: anExampleOrMethod1.
				self buildDependents: dep child: anExampleOrMethod1 ] ] 
		onRecursionDo: [ 
			self updateDependent: anExampleOrMethod1 child: anExampleOrMethod2 ]