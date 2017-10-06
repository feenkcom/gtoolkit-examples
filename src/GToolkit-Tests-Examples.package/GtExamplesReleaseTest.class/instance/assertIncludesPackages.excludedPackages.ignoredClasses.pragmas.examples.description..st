private
assertIncludesPackages: includedPackageNames excludedPackages: excludedPackageNames ignoredClasses: ignoredClasses pragmas: pragmas examples: examples description: aString
	| packages missingExamples missingExamplesWithoutIgnoredClasses obsoleteIgnoredClasses |
	
	" gather all packages that should be checked "
	packages := self includesPackages: includedPackageNames excludedPackages: excludedPackageNames.
	
	" check the given packages and filter out some classes "
	missingExamples := self packages: packages pragmas: pragmas examples: examples.
	missingExamplesWithoutIgnoredClasses := self missingExamples: missingExamples withoutIgnoredClasses: ignoredClasses.
	
	" check for missing examples - ignore some classes "
	self assert: missingExamplesWithoutIgnoredClasses isEmpty 
		description: [ 
			String streamContents: [ :stream |
				stream nextPutAll: (aString ifNil: [ 'Found missing examples in' ]); nextPutAll: ': '.
				(missingExamplesWithoutIgnoredClasses keys sorted: [ :a :b | a name < b name ]) printOn: stream ] ].
	
	" check for ignored examples which are provided - those should no longer be ignored "
	obsoleteIgnoredClasses := (ignoredClasses difference: missingExamples keys) reject: [ :each | each isNil ].
	self assert: obsoleteIgnoredClasses isEmpty 
		description: [ 
			String streamContents: [ :stream |
				stream nextPutAll: 'Examples found. Test should no longer ignore these classes: '.
				(obsoleteIgnoredClasses sorted: [ :a :b | a name < b name ]) printOn: stream ] ]