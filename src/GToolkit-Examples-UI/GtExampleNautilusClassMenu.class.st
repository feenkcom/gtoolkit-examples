Class {
	#name : #GtExampleNautilusClassMenu,
	#superclass : #GtAbstractExampleMenu,
	#category : 'GToolkit-Examples-UI'
}

{ #category : #menus }
GtExampleNautilusClassMenu class >> menuFor: aBuilder [
	<contextMenu>
	<nautilusGlobalClassMenu>
	^ self new
		menuFor: aBuilder
		yourself
]

{ #category : #private }
GtExampleNautilusClassMenu >> browseClass: aClass builder: aBuilder [
	(lastItem := aBuilder item: 'Browse examples of class "' ,  aClass name , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesOfClass: aClass ].
]

{ #category : #private }
GtExampleNautilusClassMenu >> browseHierarchyOf: aClass builder: aBuilder [
	(lastItem := aBuilder item: 'Browse examples in hierarchy of class "' , aClass name , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesInHierarchyOfClass: aClass ].
]

{ #category : #private }
GtExampleNautilusClassMenu >> browseSubclassesOf: aClass builder: aBuilder [
	(lastItem := aBuilder item: 'Browse examples in subclasses of class "' , aClass name , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesInSubclassesOfClass: aClass ].
]

{ #category : #private }
GtExampleNautilusClassMenu >> browseSuperclassesOf: aClass builder: aBuilder [
	(lastItem := aBuilder item: 'Browse examples in superclasses of class "' , aClass name , '"')
		parent: #gte;
		action: [ GtExampleNavigation browseExamplesInSuperclassesOfClass: aClass ].
]

{ #category : #public }
GtExampleNautilusClassMenu >> menuFor: aBuilder [
	| model class |
	(model := aBuilder model) ifNil: [ ^ self ].
	(class := model selectedClass) ifNil: [ ^ self ].
	
	self buildSubmenu: aBuilder.
	self inspectExamples: [ class gtExamples ] builder: aBuilder.
	self inspectReturnValue: [ class gtExamples ] builder: aBuilder.
	self inspectProblems: [ class gtExamples ] builder: aBuilder.
	self buildSeparator.
	self runExamples: [ class gtExamples ] builder: aBuilder.
	self debugExamples: [ class gtExamples ] builder: aBuilder.
	self buildSeparator.
	self browseClass: class builder: aBuilder.
	self browseSubclassesOf: class builder: aBuilder.
	self browseSuperclassesOf: class builder: aBuilder.
	self browseHierarchyOf: class builder: aBuilder
]

{ #category : #private }
GtExampleNautilusClassMenu >> submenuOrder [
	^ 1300
]
