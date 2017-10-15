private - iterating
withExampleFrom: anASTNode fromMethod: aCompiledMethod ifPresentDo: anActionBlock
	self dependencyResolvers 
		detect: [ :aResolver | aResolver appliesTo: anASTNode ]
		ifFound: [ :aResolver | 
			(aResolver 
				posibleExampleForNode: anASTNode 
				fromMethod: aCompiledMethod) 
					ifNotNil: [ :anExample | anActionBlock value: anExample ]  ]