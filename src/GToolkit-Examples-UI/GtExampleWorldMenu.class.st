Class {
	#name : #GtExampleWorldMenu,
	#superclass : #GtAbstractExampleMenu,
	#category : 'GToolkit-Examples-UI'
}

{ #category : #menus }
GtExampleWorldMenu class >> menuFor: aBuilder [
	<worldMenu>
	^ self new 
		menuFor: aBuilder;
		yourself
]

{ #category : #private }
GtExampleWorldMenu >> buildSubmenu: aBuilder [
	(lastItem := aBuilder item: #gte)
		order: 0.15;
		parent: 'Tools';
		label: 'GToolkit Examples';
		withSeparatorAfter.
]

{ #category : #private }
GtExampleWorldMenu >> inspectAllExamples: aBuilder [
	(lastItem := aBuilder item: 'Inspect all examples')
		parent: #gte;
		action: [ self examples: [ Smalltalk gtExamplesContained ] ];
		icon: Smalltalk ui icons glamorousInspect.
]

{ #category : #public }
GtExampleWorldMenu >> menuFor: aBuilder [
	self buildSubmenu: aBuilder.
	
	self inspectAllExamples: aBuilder.
	
	self buildSeparator.
	
	self browseAllExamplesWithProblems: aBuilder.
	self browseAllExamplesIgnoredByTests: aBuilder.
]
