Extension { #name : #Class }

{ #category : #'*GToolkit-Examples-Extensions' }
Class >> gtAddReturnPragmasFor: anAction [
	"To do: add an ID and an icon"

	<gtAction>
	self gtExamplesWithoutReturnPragmas ifEmpty: [ ^ anAction empty ].
	^ anAction button
		priority: 10;
		target: GtCoderClassTarget;
		icon: BrGlamorousVectorIcons empty;
		label: 'Add missing return: pragmas';
		menuItemPreview: self name;
		menuItemGroup: BrMenuItemGroupConfiguration refactoring;
		action: [ :aButton | aButton phlow spawnObject: (GtExampleReturnPragmas forClasses: {self}) ]
]

{ #category : #'*GToolkit-Examples-Extensions' }
Class >> gtCheckReturnPragmasFor: anAction [
	"To do: add an ID and an icon"

	<gtAction>
	self gtExamplesWithReturnPragmas ifEmpty: [ ^ anAction empty ].
	^ anAction button
		priority: 11;
		target: GtCoderClassTarget;
		icon: BrGlamorousVectorIcons empty;
		label: 'Check return: pragmas';
		menuItemPreview: self name;
		menuItemGroup: BrMenuItemGroupConfiguration refactoring;
		action: [ :aButton | aButton phlow spawnObject: (GtExampleReturnPragmas forClasses: {self}) ]
]

{ #category : #'*GToolkit-Examples-Extensions' }
Class class >> gtExampleClass [
	<gtExample>
	^ self
]

{ #category : #'*GToolkit-Examples-Extensions' }
Class >> gtExamplesWithReturnPragmas [
	^ self methods select: #isGtExampleWithReturnPragma
]

{ #category : #'*GToolkit-Examples-Extensions' }
Class >> gtExamplesWithoutReturnPragmas [
	^ self methods select: #isGtExampleWithoutReturnPragma
]

{ #category : #'*GToolkit-Examples-Extensions' }
Class >> hasGtExamples [
	^ self gtExamplesContained notEmpty
]
