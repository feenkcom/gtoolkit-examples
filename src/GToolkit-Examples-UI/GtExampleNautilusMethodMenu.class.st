Class {
	#name : #GtExampleNautilusMethodMenu,
	#superclass : #GtAbstractExampleMenu,
	#category : 'GToolkit-Examples-UI'
}

{ #category : #menus }
GtExampleNautilusMethodMenu class >> menuFor: aBuilder [
	<contextMenu>
	<nautilusGlobalMethodMenu>
	^ self new
		menuFor: aBuilder
		yourself
]

{ #category : #private }
GtExampleNautilusMethodMenu >> browseAfter: aCollection builder: aBuilder [
	aCollection do: [ :after | 
		after forNautilus: [ :title :action | 
			(lastItem := aBuilder item: title)
				parent: #gte;
				action: [ action value ] ] ]
]

{ #category : #private }
GtExampleNautilusMethodMenu >> browseAllDependencies: aCollection builder: aBuilder [
	(lastItem := aBuilder item: #'Browse all dependencies')
		parent: #gte;
		action: [ GtExampleNavigation browseAllDependenciesOf: aCollection ]
]

{ #category : #private }
GtExampleNautilusMethodMenu >> browseAllDependents: aCollection builder: aBuilder [
	(lastItem := aBuilder item: #'Browse all dependents')
		parent: #gte;
		action: [ GtExampleNavigation browseAllDependentsOf: aCollection ]
]

{ #category : #private }
GtExampleNautilusMethodMenu >> browseDependencies: aCollection builder: aBuilder [ 
	(lastItem := aBuilder item: #'Browse dependencies')
		parent: #gte;
		action: [ GtExampleNavigation browseDependenciesOf: aCollection ]
]

{ #category : #private }
GtExampleNautilusMethodMenu >> browseDependents: aCollection builder: aBuilder [
	(lastItem := aBuilder item: #'Browse dependents')
		parent: #gte;
		action: [ GtExampleNavigation browseDependentsOf: aCollection ]
]

{ #category : #private }
GtExampleNautilusMethodMenu >> browseExampleSubjects: aCollection builder: aBuilder [
	" this is yet too complicated - SIMPLIFY term and behavior for the user
	
	(lastItem := aBuilder item: #'Browse subjects')
		parent: #gte;
		action: [ GTExampleNavigation browseAllExampleSubjects: aCollection ];
		icon: Smalltalk ui icons glamorousDiveRight
	"
]

{ #category : #private }
GtExampleNautilusMethodMenu >> browseSubjects: aCollection builder: aBuilder [
	" this is yet too complicated - SIMPLIFY term and behavior for the user
	
	aCollection do: [ :subject | 
		subject forNautilus: [ :title :action | 			
			(lastItem := aBuilder item: title)
				parent: #gte;
				action: [ action value ] ] ]
	"
]

{ #category : #public }
GtExampleNautilusMethodMenu >> menuFor: aBuilder [
	| model method examples |
	(model := aBuilder model) ifNil: [ ^ self ].
	(method := model selectedMethod) ifNil: [ ^ self ].
	examples := method gtExamples reject: [ :each | each isNil ].
	
	self buildSubmenu: aBuilder.
	examples ifNotEmpty: [ 
		| problems arguments subjects afters |
		problems := (examples gather: [ :each | each problems ]) reject: [ :each | each isNil ].
		arguments := (examples gather: [ :each | each arguments ]) reject: [ :each | each isNil ].
		afters := (examples collect: [ :each | each after ]) reject: [ :each | each isNil ].
		subjects := (examples gather: [ :each | each subjects ]) reject: [ :each | each isNil ].
		self inspectExamples: [ examples ] builder: aBuilder.
		self inspectReturnValue: [ examples ] builder: aBuilder.
		problems ifNotEmpty: [
			self inspectProblems: [ examples ] builder: aBuilder.
			self buildSeparator ].
		self buildSeparator.
		self runExamples: [ examples ] builder: aBuilder.
		self debugExamples: [ examples ] builder: aBuilder ]
]

{ #category : #private }
GtExampleNautilusMethodMenu >> submenuOrder [
	^ 1450
]
