actions
resolveDependenciesForExample: anExample
	| exampleDependencies |
	
	exampleDependencies := OrderedCollection new.
	anExample method ast nodesDo: [ :aNode | 
		self withExampleFrom: aNode fromMethod: anExample method ifPresentDo: [ :possibleExampleDependency |
			exampleDependencies 
					detect: [ :anotherExample | anotherExample = possibleExampleDependency ]
					ifNone: [ exampleDependencies add: possibleExampleDependency ] ] ].
	^ exampleDependencies