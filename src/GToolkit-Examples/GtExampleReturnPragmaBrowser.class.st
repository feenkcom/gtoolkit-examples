"
I am a browser for exploring which packages containing examples that are missing `<return:>` pragmas, and repairing them.

NB: Work in progress
"
Class {
	#name : #GtExampleReturnPragmaBrowser,
	#superclass : #Object,
	#instVars : [
		'packagesMissingReturnPragmas',
		'packages'
	],
	#category : #'GToolkit-Examples-Utilities'
}

{ #category : #'instance creation' }
GtExampleReturnPragmaBrowser class >> for: aPackageCollection [
	^ self new
		packages: aPackageCollection;
		yourself
]

{ #category : #accessing }
GtExampleReturnPragmaBrowser >> allGtExamplesWithoutReturnPragmas [
	^ self packages flatCollect: #gtExamplesWithoutReturnPragmas
]

{ #category : #views }
GtExampleReturnPragmaBrowser >> gtExamplesMissingReturnPragmaFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Examples missing return:';
		items: [ self allGtExamplesWithoutReturnPragmas ];
		column: 'Index' 
			text: [ :eachItem :eachIndex | 
				eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Value' text: [ :each | each gtDisplayString ];
		actionButtonIcon: BrGlamorousVectorIcons repair
			tooltip: 'Add return: pragmas'
			action: [ :aButton :aTab | "aButton phlow spawnObject: self children" ];
		actionUpdateButton
]

{ #category : #views }
GtExampleReturnPragmaBrowser >> gtPackagesWithExamplesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Example Packages';
		priority: 10;
		items: [ self packagesWithExamples ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Class' text: [ :each | each gtDisplayString ]
		width: 300;
		column: '# Examples' text: [ :each | each gtExamplesContained size ];
		actionUpdateButton
]

{ #category : #views }
GtExampleReturnPragmaBrowser >> gtViewFor: aView [
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
		actionUpdateButton
]

{ #category : #accessing }
GtExampleReturnPragmaBrowser >> packages [
	^ packages ifNil: [ packages := Smalltalk packages sorted ]
]

{ #category : #accessing }
GtExampleReturnPragmaBrowser >> packages: aPackageCollection [
	packages := aPackageCollection
]

{ #category : #accessing }
GtExampleReturnPragmaBrowser >> packagesMissingReturnPragmas [
	^ packagesMissingReturnPragmas
		ifNil: [ packagesMissingReturnPragmas := self packages
					collect: [ :p | p -> p gtExamplesWithoutReturnPragmas ]
					thenSelect: [ :kv | kv value notEmpty ] ]
]

{ #category : #accessing }
GtExampleReturnPragmaBrowser >> packagesWithExamples [
	^ (self packages select: #hasGtExamples) sorted
]
