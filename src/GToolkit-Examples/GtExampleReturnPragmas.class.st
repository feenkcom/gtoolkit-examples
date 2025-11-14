"
I am a browser for exploring which packages containing examples that are missing `<return:>` pragmas, and repairing them.

NB: Work in progress
"
Class {
	#name : #GtExampleReturnPragmas,
	#superclass : #Object,
	#instVars : [
		'packagesMissingReturnPragmas',
		'packages'
	],
	#category : #'GToolkit-Examples-Utilities'
}

{ #category : #'instance creation' }
GtExampleReturnPragmas class >> for: aPackageCollection [
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

{ #category : #accessing }
GtExampleReturnPragmas >> allGtExamplesWithReturnPragmas [
	^ self packages flatCollect: #gtExamplesWithReturnPragmas
]

{ #category : #accessing }
GtExampleReturnPragmas >> allGtExamplesWithoutReturnPragmas [
	^ self packages flatCollect: #gtExamplesWithoutReturnPragmas
]

{ #category : #updating }
GtExampleReturnPragmas >> checkReturnPragmasRefactoring [
	| namespace |
	namespace := RBNamespace new.
	self allGtExamplesWithReturnPragmas
		do: [ :m | m checkReturnPragmasRefactoring: namespace ].
	^ namespace
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

{ #category : #views }
GtExampleReturnPragmas >> gtExamplesMissingReturnPragmaFor: aView [
	<gtView>
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
	^ aView columnedList
		title: 'Examples with return:';
		priority: 35;
		items: [ self allGtExamplesWithReturnPragmas ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Value' text: [ :each | each gtDisplayString ];
		actionButtonIcon: BrGlamorousVectorIcons repair
			tooltip: 'Add return: pragmas'
			action: [ :aButton :aTab | aButton phlow spawnObject: self checkReturnPragmasRefactoring ];
		actionUpdateButton
]

{ #category : #views }
GtExampleReturnPragmas >> gtPackagesWithExamplesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Example Packages';
		priority: 10;
		items: [ self packagesWithExamples ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Class'
			text: [ :each | each gtDisplayString ]
			width: 300;
		column: '# Examples' text: [ :each | each gtExamplesContained size ];
		send: [ :each | GtExampleReturnPragmas for: {each} ];
		actionUpdateButton
]

{ #category : #views }
GtExampleReturnPragmas >> gtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Packages missing return:';
		priority: 20;
		items: [ self packagesMissingReturnPragmas ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Package'
			text: [ :each | each key ]
			width: 300;
		column: '# missing'
			text: [ :each | each value size ]
			width: 300;
		send: [ :each | GtExampleReturnPragmas for: {each key} ];
		actionUpdateButton
]

{ #category : #accessing }
GtExampleReturnPragmas >> packages [
	^ packages ifNil: [ packages := self defaultPackages ]
]

{ #category : #accessing }
GtExampleReturnPragmas >> packages: aPackageCollection [
	packages := aPackageCollection
]

{ #category : #accessing }
GtExampleReturnPragmas >> packagesMissingReturnPragmas [
	^ packagesMissingReturnPragmas
		ifNil: [ packagesMissingReturnPragmas := self packages
					collect: [ :p | p -> p gtExamplesWithoutReturnPragmas ]
					thenSelect: [ :kv | kv value notEmpty ] ]
]

{ #category : #accessing }
GtExampleReturnPragmas >> packagesWithExamples [
	^ (self packages select: #hasGtExamples) sorted
]
