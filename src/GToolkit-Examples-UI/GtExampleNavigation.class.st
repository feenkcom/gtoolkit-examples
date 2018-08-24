"
I define a series of methods for navigating and browsing examples and their dependencies. 
"
Class {
	#name : #GtExampleNavigation,
	#superclass : #Object,
	#category : 'GToolkit-Examples-UI'
}

{ #category : #private }
GtExampleNavigation class >> browse: aString examples: aCollection [
	| env |
	env := RBSelectorEnvironment new.
	aCollection do: [ :example |
		env addClass: example methodClass selector: example selector ].
	env isEmpty 
		ifTrue: [ ^ UIManager default inform: 'No examples found' ].
	^ env gtBrowseFor: aString
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseAllDependenciesOf: aCollectionOfExamples [
	self browse: 'Dependencies' examples: (aCollectionOfExamples gather: [ :each | each allDependencies ])
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseAllDependentsOf: aCollectionOfExamples [
	self browse: 'All dependents' examples: (aCollectionOfExamples gather: [ :each | each allDependents ])
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseAllExampleAfterMethods: aCollectionOfExamples [
	" self browseAllExampleAfterMethods: GTExample "
	| env |
	env := RBSelectorEnvironment new.
	aCollectionOfExamples do: [ :example | 
		example after ifNotNil: [
			example after addToSelectorEnvironment: env ] ].
	^ env gtBrowseFor: 'After-methods'
]

{ #category : #private }
GtExampleNavigation class >> browseAllExampleSubjects: aCollectionOfExamples [
	" self browseAllExamplesWithSubject: GTExample "
	| env |
	env := RBSelectorEnvironment new.
	aCollectionOfExamples do: [ :example | 
		example subjects do: [ :subject | 
			subject ifNotNil: [ 
				subject addToSelectorEnvironment: env ] ] ].
	^ env gtBrowseFor: 'Subjects'
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseDependenciesOf: aCollectionOfExamples [
	self browse: 'Dependencies' examples: (aCollectionOfExamples gather: [ :each | each dependencies ])
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseDependentsOf: aCollectionOfExamples [
	self browse: 'Dependents' examples: (aCollectionOfExamples gather: [ :each | each directDependents ])
]

{ #category : #'browse globally' }
GtExampleNavigation class >> browseExamples [
	" self browseAllExamples "
	self browseExamples: 'Examples' select: [ :example | true ]
]

{ #category : #private }
GtExampleNavigation class >> browseExamples: aString select: aBlock [
	^ self browse: aString examples: (Smalltalk gtExamplesContained select: [ :example | aBlock value: example ])
]

{ #category : #'browse globally' }
GtExampleNavigation class >> browseExamplesIgnoredByTests [
	" self browseAllExamplesIgnoredByTests "
	self browseExamples: 'Examples ignored by tests' select: [ :example | 
		example ignoreTest 
			or: [ example ignoreTestReport ] ]
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseExamplesInHierarchyOfClass: aClass [
	self browse: 'Examples in hierarchy of class "' , aClass name , '"' examples: (aClass withAllSubclasses gather: [ :each | each gtExamples ]), (aClass allSuperclasses gather: [ :each | each gtExamples ])
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseExamplesInSubclassesOfClass: aClass [
	self browse: 'Examples in subclasses of class "' , aClass name , '"' examples: (aClass withAllSubclasses gather: [ :each | each gtExamples ])
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseExamplesInSuperclassesOfClass: aClass [
	self browse: 'Examples in superclasses of class "' , aClass name , '"' examples: (aClass withAllSuperclasses gather: [ :each | each gtExamples ])
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseExamplesLiteralThorough: aString [
	" self browseExamplesLiteralThorough: #and: "
	self browseExamples: 'Examples with literal "', aString, '"' select: [ :example | 
		example hasLiteralThorough: aString ]
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseExamplesOfClass: aClass [
	self browse: 'Examples of class "' , aClass name, '"' examples: aClass gtExamples
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseExamplesOfPackage: anRPackage [
	self browse: 'Examples of package "' , anRPackage packageName, '"' examples: anRPackage gtExamplesContained
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseExamplesReferencing: aLiteral [
	" self browseAllExamplesReferencing: #and: "
	self browseExamples: 'Examples referencing "', aLiteral asString, '"' select: [ :example | 
		example isReferencing: aLiteral ]
]

{ #category : #'browse globally' }
GtExampleNavigation class >> browseExamplesWithDependencies [
	" self browseAllExamplesWithDependencies "
	self browseExamples: 'Examples with dependencies' select: [ :example | 
		example hasArguments ]
]

{ #category : #'browse globally' }
GtExampleNavigation class >> browseExamplesWithProblems [
	" self browseExamplesWithProblems "
	self browseExamples: 'Examples with problems' select: [ :example | 
		example hasProblems ]
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseExamplesWithSubject: aGTExampleSubject [
	" self browseAllExamplesWithSubject: GTExample "
	self browseExamples: 'Examples with subject "', aGTExampleSubject gtDisplayString, '"' select: [ :example | 
		example hasSubject: aGTExampleSubject ]
]

{ #category : #'browse with scope' }
GtExampleNavigation class >> browseExamplesWithSubjectMatching: aGTExampleSubject [
	" self browseAllExamplesWithSubject: GTExample "
	self browseExamples: 'Examples with subject "', aGTExampleSubject gtDisplayString, '"' select: [ :example | 
		example hasSubjectMatching: aGTExampleSubject ]
]
