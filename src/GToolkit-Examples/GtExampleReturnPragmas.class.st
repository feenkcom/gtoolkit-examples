"
I am a browser for exploring which packages containing examples that are missing `<return:>` pragmas, and repairing them.

NB: Work in progress
"
Class {
	#name : #GtExampleReturnPragmas,
	#superclass : #Object,
	#instVars : [
		'packagesMissingReturnPragmas',
		'packages',
		'classes',
		'examples'
	],
	#category : #'GToolkit-Examples-Utilities'
}

{ #category : #'instance creation' }
GtExampleReturnPragmas class >> forClasses: aClassCollection [
	^ self new
		classes: aClassCollection;
		yourself
]

{ #category : #'instance creation' }
GtExampleReturnPragmas class >> forExamples: aGtExampleCollection [
	^ self new
		examples: aGtExampleCollection;
		yourself
]

{ #category : #'instance creation' }
GtExampleReturnPragmas class >> forPackages: aPackageCollection [
	^ self new
		packages: aPackageCollection;
		yourself
]

{ #category : #action }
GtExampleReturnPragmas class >> gtInstanceButtonFor: anAction [
	<gtClassAction>
	^ anAction button
		tooltip: 'Inspect return pragmas';
		priority: 10;
		icon: BrGlamorousVectorIcons playinspect;
		action: [ :aButton | aButton phlow spawnObject: self new]
]

{ #category : #updating }
GtExampleReturnPragmas >> addReturnPragmasRefactoring [
	| namespace |
	namespace := RBNamespace new.
	self allGtExamplesWithoutReturnPragmas
		do: [ :m | m addReturnPragmasRefactoring: namespace ].
	^ namespace
]

{ #category : #querying }
GtExampleReturnPragmas >> allGtExamplesWithReturnPragmas [
	^ self gtExampleMethods select: #isGtExampleWithReturnPragma
]

{ #category : #querying }
GtExampleReturnPragmas >> allGtExamplesWithoutReturnPragmas [
	^ self gtExampleMethods select: #isGtExampleWithoutReturnPragma
]

{ #category : #updating }
GtExampleReturnPragmas >> checkReturnPragmasRefactoring [
	| namespace |
	namespace := RBNamespace new.
	self allGtExamplesWithReturnPragmas
		do: [ :m | m checkReturnPragmasRefactoring: namespace ].
	^ namespace
]

{ #category : #accessing }
GtExampleReturnPragmas >> classes [
	^ classes
]

{ #category : #accessing }
GtExampleReturnPragmas >> classes: anObject [
	classes := anObject
]

{ #category : #querying }
GtExampleReturnPragmas >> classesMissingReturnPragmas [
	^  self classes
					select: [ :c | c gtExamplesWithoutReturnPragmas notEmpty ] 
]

{ #category : #querying }
GtExampleReturnPragmas >> classesWithExamples [
	^ (self classes select: #hasGtExamples) sorted
]

{ #category : #initialization }
GtExampleReturnPragmas >> defaultPackages [
	"We only want by default packages that are actually in loaded repos that we can commit to."

	| defaultPackages |
	defaultPackages := (IceRepository registry flatCollect: #packages)
			select: #isLoaded.

	self
		assert: defaultPackages notEmpty
		description: 'There are no packages in loaded repos.'.

	^ defaultPackages collect: [ :p | p package asPackage ]
]

{ #category : #accessing }
GtExampleReturnPragmas >> examples [
	^ examples
]

{ #category : #accessing }
GtExampleReturnPragmas >> examples: anObject [
	examples := anObject
]

{ #category : #views }
GtExampleReturnPragmas >> gtClassesWithExamplesFor: aView [
	<gtView>
	self isForClasses ifFalse: [^ aView empty].
	^ aView columnedList
		title: 'Example Classes';
		priority: 10;
		items: [ self classes ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Class'
			text: [ :each | each gtDisplayString ]
			width: 300;
		column: '# Examples (including noTest)'
			text: [ :each | each gtExamplesContained size ]
			width: 200;
		column: '# Examples with return: pragmas'
			text: [ :each | each gtExamplesWithReturnPragmas size ]
			width: 200;
		column: '# Examples  without return: pragmas'
			text: [ :each | each gtExamplesWithoutReturnPragmas size ]
			width: 200;
		actionUpdateButton;
		send: [ :each | GtExampleReturnPragmas for: {each} ]
]

{ #category : #querying }
GtExampleReturnPragmas >> gtExampleMethods [
	self isForPackages
		ifTrue: [ ^ (self packages flatCollect: #gtExamplesContained) collect: #method ].
	self isForClasses
		ifTrue: [ ^ (self classes flatCollect: #gtExamples) collect: #method ].
	self assert: self isForExamples.
	^ self examples select: #isGTExampleMethod
]

{ #category : #views }
GtExampleReturnPragmas >> gtExamplesMissingReturnPragmaFor: aView [
	<gtView>
	self allGtExamplesWithoutReturnPragmas ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'Examples missing return:';
		priority: 30;
		items: [ self allGtExamplesWithoutReturnPragmas ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Value' text: [ :each | each gtDisplayString ];
		actionButtonIcon: BrGlamorousVectorIcons repair
			tooltip: 'Add return: pragmas'
			action: [ :aButton :aTab | aButton phlow spawnObject: self addReturnPragmasRefactoring ];
		actionUpdateButton
]

{ #category : #views }
GtExampleReturnPragmas >> gtExamplesWithReturnPragmaFor: aView [
	<gtView>
	self allGtExamplesWithReturnPragmas ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'Examples with return:';
		priority: 35;
		items: [ self allGtExamplesWithReturnPragmas ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Value' text: [ :each | each gtDisplayString ];
		column: 'Return:' text: [ :each | each returnPragmaClass ];
		actionButtonIcon: BrGlamorousVectorIcons repair
			tooltip: 'Check return: pragmas'
			action: [ :aButton :aTab | aButton phlow spawnObject: self checkReturnPragmasRefactoring ];
		actionUpdateButton
]

{ #category : #views }
GtExampleReturnPragmas >> gtPackagesMissingReturnPragmasFor: aView [
	<gtView>
	self isForPackages ifFalse: [^ aView empty].
	self packagesMissingReturnPragmas ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'Packages missing return:';
		priority: 20;
		items: [ self packagesMissingReturnPragmas ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Package'
			text: [ :each | each gtDisplayString ]
			width: 300;
		column: '# Examples (including noTest)'
			text: [ :each | each gtExamplesContained size ]
			width: 200;
		column: '# Examples with return: pragmas'
			text: [ :each | each gtExamplesWithReturnPragmas size ]
			width: 200;
		column: '# Examples  without return: pragmas'
			text: [ :each | each gtExamplesWithoutReturnPragmas size ]
			width: 200;
		actionUpdateButton;
		send: [ :each | GtExampleReturnPragmas for: {each} ]
]

{ #category : #views }
GtExampleReturnPragmas >> gtPackagesWithExamplesFor: aView [
	<gtView>
	self isForPackages ifFalse: [^ aView empty].
	^ aView columnedList
		title: 'Example Packages';
		priority: 10;
		items: [ self packagesWithExamples ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Package'
			text: [ :each | each gtDisplayString ]
			width: 300;
		column: '# Examples (including noTest)'
			text: [ :each | each gtExamplesContained size ]
			width: 200;
		column: '# Examples with return: pragmas'
			text: [ :each | each gtExamplesWithReturnPragmas size ]
			width: 200;
		column: '# Examples  without return: pragmas'
			text: [ :each | each gtExamplesWithoutReturnPragmas size ]
			width: 200;
		actionUpdateButton;
		send: [ :each | GtExampleReturnPragmas for: {each} ]
]

{ #category : #testing }
GtExampleReturnPragmas >> isForClasses [
	^ self classes isNotNil
]

{ #category : #testing }
GtExampleReturnPragmas >> isForExamples [
	^ self examples isNotNil
]

{ #category : #testing }
GtExampleReturnPragmas >> isForPackages [
	"Default case"

	^ self classes isNil and: [ self examples isNil ]
]

{ #category : #accessing }
GtExampleReturnPragmas >> packages [
	^ packages ifNil: [ packages := self defaultPackages ]
]

{ #category : #accessing }
GtExampleReturnPragmas >> packages: aPackageCollection [
	packages := aPackageCollection
]

{ #category : #querying }
GtExampleReturnPragmas >> packagesMissingReturnPragmas [
	^ packagesMissingReturnPragmas
		ifNil: [ packagesMissingReturnPragmas := self packages
					select: [ :p | p gtExamplesWithoutReturnPragmas notEmpty ] ]
]

{ #category : #querying }
GtExampleReturnPragmas >> packagesWithExamples [
	^ (self packages select: #hasGtExamples) sorted
]
