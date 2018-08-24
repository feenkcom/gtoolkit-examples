Class {
	#name : #GtExamplesReleaseTest,
	#superclass : #TestCase,
	#category : 'GToolkit-Tests-Examples-SUnit'
}

{ #category : #private }
GtExamplesReleaseTest >> assertIncludesPackages: includedPackageNames excludedPackages: excludedPackageNames ignoredClasses: ignoredClasses pragmas: pragmas examples: examples description: aString [
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
]

{ #category : #private }
GtExamplesReleaseTest >> includesPackages: includedPackageNames excludedPackages: excludedPackageNames [
	| packages |
	packages := OrderedCollection new.
	(RPackageOrganizer default packages 
		sorted: [ :a :b | a packageName < b packageName ]) 
		do: [ :package |
			((includedPackageNames isEmptyOrNil
				or: [ includedPackageNames anySatisfy: [ :packageName | package packageName asLowercase beginsWith: packageName asLowercase ] ])
					and: [ excludedPackageNames isEmptyOrNil
						or: [ excludedPackageNames noneSatisfy: [ :packageName | package packageName asLowercase beginsWith: packageName asLowercase ] ] ])
							ifTrue: [ packages add: package ] ].
	^ packages
]

{ #category : #private }
GtExamplesReleaseTest >> missingExamples: missingExamples withoutIgnoredClasses: classes [
	| missingExamplesWithoutIgnoredClasses |
	classes isEmptyOrNil ifTrue: [ ^ missingExamples ].
	missingExamplesWithoutIgnoredClasses := missingExamples copy.
	classes do: [ :class | missingExamplesWithoutIgnoredClasses removeKey: class ifAbsent: [  ] ].
	^ missingExamplesWithoutIgnoredClasses
]

{ #category : #private }
GtExamplesReleaseTest >> packages: packages pragmas: pragmasRequiringExamples examples: examplePragmas [
	| missingExamples |
	missingExamples := Dictionary new.
	packages do: [ :package |
		package classes do: [ :class |
			(self shouldDefineExamples: class)  ifTrue: [ " we are only interested in classes "
				| methodsRequiringExamples |
				methodsRequiringExamples := pragmasRequiringExamples flatCollect: [ :each | Pragma allNamed: each in: class ].
				methodsRequiringExamples ifNotEmpty: [ " example required "
					| exampleMethods |
					exampleMethods := examplePragmas flatCollect: [ :each | Pragma allNamed: each in: class theMetaClass ].
					exampleMethods ifEmpty: [ " something is missing - check which package would require the example "
						(methodsRequiringExamples anySatisfy: [ :pragma | (packages includes: pragma method package) ]) ifTrue: [ 
							missingExamples 
								at: class 
								put: (methodsRequiringExamples collect: [ :pragma | pragma method ]) ] ] ] ] ] ].
	^ missingExamples
]

{ #category : #private }
GtExamplesReleaseTest >> shouldDefineExamples: class [
	^ (class theNonMetaClass = class)
		and: [ class isTrait not 
			and: [ (class theNonMetaClass name includesSubstring: 'abstract' caseSensitive: false) not 
				and: [ (class theNonMetaClass name includesSubstring: 'mock' caseSensitive: false) not ] ] ]
]

{ #category : #tests }
GtExamplesReleaseTest >> testAllMissingExternalExamples [
	<toBeDeprecated: #gtExample:>
	self assertIncludesPackages: nil
		excludedPackages: { 'Glamour-'. 'GT-'. 'GToolkit-'. 'Moose-'. 'Petit'. 'Renraku'. 'Slot'. 'Opal'. 'Roassal' }
		ignoredClasses: { }
		pragmas: #( #spotterOrder: #gtInspectorPresentationOrder: )
		examples: #( #gtExample #gtExample: )
		description: 'All missing external examples'
]

{ #category : #tests }
GtExamplesReleaseTest >> testAllMissingInternalExamples [
	<toBeDeprecated: #gtExample:>
	self assertIncludesPackages: { 'Glamour-'. 'GT-'. 'GToolkit-'. 'Moose-'. }
		excludedPackages: nil
		ignoredClasses: {
			ComposableModel. 
			GtExample. " skeleton object "
			GtExampleMethodAfter. " would require mocks "
			GTEventCollectors. 
			GTEventRecorder. 
			MetacelloVersionLoadDirective. " corrupt package detection "
			MorphicTreeNodeAdapter. " corrupt package detection "
			Slot. " corrupt package detection "
			ZnMessage. " corrupt package detection "
			GtExampleIcon. "abstract"
			GtExampleSubject. "abstract"
			CompiledCode. "abstract"
			TraitDescription.
		}
		pragmas: #( #spotterOrder: #gtInspectorPresentationOrder: )
		examples: #( #gtExample #gtExample: )
		description: 'All missing internal examples'
]

{ #category : #tests }
GtExamplesReleaseTest >> testMissingGTInspectorExamples [
	<toBeDeprecated: #gtExample:>
	self assertIncludesPackages: { 'GT-Inspector' }
		excludedPackages: nil
		ignoredClasses: {
			ComposableModel. " abstract superclass "
			MetacelloVersionLoadDirective. " corrupt package detection "
			MorphicTreeNodeAdapter. " corrupt package detection "
			ZnMessage. " abstract factory & superclass / subclasses provide examples "
			CompiledCode. "abstract"
		}
		pragmas: #( #gtInspectorPresentationOrder: )
		examples: #( #gtExample #gtExample: )
		description: 'Missing examples for GTInspector'
]

{ #category : #tests }
GtExamplesReleaseTest >> testMissingGTSpotterExamples [
	<toBeDeprecated: #gtExample:>
	self assertIncludesPackages: { 'GT-Spotter' }
		excludedPackages: nil
		ignoredClasses: { 
			Slot. " abstract "
		}
		pragmas: #( #spotterOrder: )
		examples: #( #gtExample #gtExample: )
		description: 'Missing examples for GTSpotter'
]

{ #category : #tests }
GtExamplesReleaseTest >> testMissingTests [
	self flag: 'maybe enhance the following abstract classes (generic extension may work for most/all subclasses). Most/all subclasses would be examples. Intermediate classes are not tagged as abstract - not distinguishable - #allSubclasses doesn^t work. Announcer. Canvas. ComposableModel OCAbstractScope. RTView. TRCanvas. IRInstruction. Slot. Slot/Inspector is buggy'.
	self flag: 'find a solution to provide examples for TClass + MooseModel but still have usable tests / examples in both classes will slow down tests tremendously'
]
