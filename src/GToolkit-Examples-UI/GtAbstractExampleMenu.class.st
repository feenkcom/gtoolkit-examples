Class {
	#name : #GtAbstractExampleMenu,
	#superclass : #Object,
	#instVars : [
		'lastItem'
	],
	#category : 'GToolkit-Examples-UI'
}

{ #category : #menus }
GtAbstractExampleMenu class >> menuFor: aBuilder [
	self subclassResponsibility 
]

{ #category : #private }
GtAbstractExampleMenu >> browseAllExamples: aBuilder [
	(lastItem := aBuilder item: 'Browse all examples')
		parent: #gte;
		keyText: 'e, a' if: Nautilus useOldStyleKeys not;
		action: [ GtExampleNavigation browseExamples ];
		icon: Smalltalk ui icons nautilus

]

{ #category : #private }
GtAbstractExampleMenu >> browseAllExamplesIgnoredByTests: aBuilder [		
	(lastItem := aBuilder item: 'Browse all examples ignored by tests')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesIgnoredByTests ]
]

{ #category : #private }
GtAbstractExampleMenu >> browseAllExamplesWithDependencies: aBuilder [
	(lastItem := aBuilder item: 'Browse all examples with dependencies')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesWithDependencies ]
]

{ #category : #private }
GtAbstractExampleMenu >> browseAllExamplesWithProblems: aBuilder [		
	(lastItem := aBuilder item: 'Browse all examples with problems')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesWithProblems ];
		icon: Smalltalk ui icons smallError.
]

{ #category : #private }
GtAbstractExampleMenu >> browseExamplesReferencing: aLiteral builder: aBuilder [	
	(lastItem := aBuilder item: 'Browse examples referencing "' ,  aLiteral , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesReferencing: aLiteral ]
]

{ #category : #private }
GtAbstractExampleMenu >> browseExamplesWithSubject: aLiteral builder: aBuilder [
	" this is yet too complicated - SIMPLIFY term and behavior for the user
	
	(lastItem := aBuilder item: 'Browse examples with subject ""' ,  aLiteral gtDisplayString , '""')
		parent: #gte;
		action: [ GTExampleNavigation browseExamplesWithSubject: aLiteral ]
	"
]

{ #category : #private }
GtAbstractExampleMenu >> buildAllDependencies: aCollection builder: aBuilder with: aBlock [
	^ (aBuilder item: #'Browse all dependencies')
		parent: #gte;
		action: [ GtExampleNavigation browseAllDependenciesOf: aCollection ]
]

{ #category : #private }
GtAbstractExampleMenu >> buildAllDependents: aCollection builder: aBuilder [
	^ (aBuilder item: #'Browse all dependents')
		parent: #gte;
		action: [ GtExampleNavigation browseAllDependentsOf: aCollection ]
]

{ #category : #private }
GtAbstractExampleMenu >> buildDependencies: aCollection builder: aBuilder [ 
	^ (aBuilder item: #'Browse dependencies')
		parent: #gte;
		action: [ GtExampleNavigation browseDependenciesOf: aCollection ]
]

{ #category : #private }
GtAbstractExampleMenu >> buildDependents: aCollection builder: aBuilder [
	^ (aBuilder item: #'Browse dependents')
		parent: #gte;
		action: [ GtExampleNavigation browseDependentsOf: aCollection ]
]

{ #category : #private }
GtAbstractExampleMenu >> buildSeparator [
	lastItem ifNil: [ ^ self ].
	lastItem withSeparatorAfter
]

{ #category : #private }
GtAbstractExampleMenu >> buildSubmenu: aBuilder [
	(lastItem := aBuilder item: #gte)
		order: self submenuOrder;
		label: 'GToolkit Examples';
		withSeparatorAfter.
]

{ #category : #private }
GtAbstractExampleMenu >> debugExamples: aBlock builder: aBuilder [
	(lastItem := aBuilder item: 'Debug examples')
		parent: #gte;
		keyText: 'e, d' if: Nautilus useOldStyleKeys not;
		action: [ self examples: aBlock withProgressCollect: [ :each | each debug ] ];
		icon: Smalltalk ui icons smallDebug.
]

{ #category : #utils }
GtAbstractExampleMenu >> examples: aBlock [
	self examples: aBlock select: [ :each | true ]
]

{ #category : #utils }
GtAbstractExampleMenu >> examples: aBlock1 collect: aBlock2 [
	self examples: aBlock1 select: [ :each | true ] collect: [ :each | aBlock2 value: each ]
]

{ #category : #utils }
GtAbstractExampleMenu >> examples: aCollection do: aBlock1 progress: aBlock2 [
	| progress |
	aCollection size < 2 ifTrue: [ ^ aCollection do: aBlock1 ].
	aBlock2 ifNil: [ ^ aCollection do: aBlock1 ].
	(progress := aBlock2 value: aCollection) isEmptyOrNil ifTrue: [ ^ aCollection do: aBlock1 ].
	aCollection do: aBlock1 displayingProgress: progress
]

{ #category : #utils }
GtAbstractExampleMenu >> examples: examplesBlock select: selectionBlock [
	| examples |
	examples := examplesBlock value select: [ :example | 
		example isGTExample and: [ selectionBlock value: example ] ].
	examples
		ifNotEmpty: [ (GtExampleGroup new examples: examples) inspect ]
		ifEmpty: [ self notifyNoExamples ]
]

{ #category : #utils }
GtAbstractExampleMenu >> examples: aBlock1 select: aBlock2 collect: aBlock3 [
	| examples |
	examples := Dictionary new.
	aBlock1 value 
		select: [ :each | each isGTExample and: [ aBlock2 value: each ] ] 
		thenDo: [ :each | examples at: each put: (aBlock3 value: each) ].
	examples
		ifNotEmpty: [ examples inspect ]
		ifEmpty: [ self notifyNoExamples ]
]

{ #category : #utils }
GtAbstractExampleMenu >> examples: aBlock1 select: aBlock2 collect: aBlock3 progress: aBlock4 [
	| results |
	results := Dictionary new.
	self examples: (aBlock1 value select: [ :each | each isGTExample and: [ aBlock2 value: each ] ]) 
		do: [ :each | results at: each put: (aBlock3 value: each) ]
		progress: aBlock4.
	results
		ifNotEmpty: [ 
			(results size = 1
				ifTrue: [ results anyOne ]
				ifFalse: [ results ]) inspect ]
		ifEmpty: [ self notifyNoExamples ]
]

{ #category : #utils }
GtAbstractExampleMenu >> examples: aBlock1 withProgressCollect: aBlock2 [
	self examples: aBlock1 
		select: [ :each | true ] 
		collect: [ :each | aBlock2 value: each ] 
		progress: [ :examples | 'Processing ' , examples size asString , ' examples ...' ]
]

{ #category : #private }
GtAbstractExampleMenu >> inspectExamples: aBlock builder: aBuilder [
	(lastItem := aBuilder item: 'Inspect examples')
		parent: #gte;
		keyText: 'e, i' if: Nautilus useOldStyleKeys not;
		action: [ self examples: aBlock ];
		icon: Smalltalk ui icons glamorousInspect.
]

{ #category : #private }
GtAbstractExampleMenu >> inspectProblems: aBlock builder: aBuilder [
	(lastItem := aBuilder item: 'Inspect problems')
		parent: #gte;
		action: [ self examples: aBlock select: [ :each | each hasProblems ] collect: [ :each | each problems ] ];
		icon: (Smalltalk ui icons iconNamed: #smallError)
]

{ #category : #private }
GtAbstractExampleMenu >> inspectResults: aBlock builder: aBuilder [
	(lastItem := aBuilder item: 'Inspect results (full)')
		parent: #gte;
		action: [ self examples: aBlock withProgressCollect: [ :example | example result ] ].
]

{ #category : #private }
GtAbstractExampleMenu >> inspectReturnValue: aBlock builder: aBuilder [
	(lastItem := aBuilder item: #'Inspect return-values')
		parent: #gte;
		keyText: 'e, v' if: Nautilus useOldStyleKeys not;
		action: [ self examples: aBlock withProgressCollect: [ :example | example returnValue ] ].
]

{ #category : #public }
GtAbstractExampleMenu >> menuFor: aBuilder [
]

{ #category : #utils }
GtAbstractExampleMenu >> notifyNoExamples [
	GrowlMorph 
		openWithLabel: 'GT Examples'
		contents: 'No examples found within the current selection' 
]

{ #category : #private }
GtAbstractExampleMenu >> runExamples: aBlock builder: aBuilder [
	(lastItem := aBuilder item: 'Run examples')
		parent: #gte;
		keyText: 'e, r' if: Nautilus useOldStyleKeys not;
		action: [ self examples: aBlock withProgressCollect: [ :each | each run ] ];
		icon: Smalltalk ui icons smallDoIt.
]

{ #category : #private }
GtAbstractExampleMenu >> submenuOrder [
	^ -9999
]
