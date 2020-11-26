"
I represent a group of examples.

I am particularly useful for manipulating multiple examples at the same time, typically in a user interface (such as the inspector).
"
Class {
	#name : #GtExampleGroup,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'ignoreAnnouncements'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #'instance creation' }
GtExampleGroup class >> withAll: aCollection [
	^ GtExplicitExampleGroup new examples: aCollection
]

{ #category : #accessing }
GtExampleGroup >> announcer [
	<return: #Announcer>
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GtExampleGroup >> announcer: anAnnouncer [
	self 
		assert: [ anAnnouncer isNotNil ]
		description: [ 'Example Group Announcer must be non-nil' ].
	announcer := anAnnouncer
]

{ #category : #enumerating }
GtExampleGroup >> collect: aBlockClosure [ 
	^ self examples collect: aBlockClosure
]

{ #category : #enumerating }
GtExampleGroup >> count: aBlockClosure [ 
	^ self examples count: aBlockClosure
]

{ #category : #enumerating }
GtExampleGroup >> detect: aBlockClosure [ 
	^ self examples detect: aBlockClosure 
]

{ #category : #enumerating }
GtExampleGroup >> directDependenciesFor: aGtExampleWithResult [
	| dependencies |
	dependencies := aGtExampleWithResult directDependencies.
	^ dependencies collect: [ :eachGtExample | 
		self examples 
			detect: [ :eachGtExampleWithResult | 
				(eachGtExampleWithResult methodClass = eachGtExample methodClass)
					and: [ eachGtExampleWithResult selector = eachGtExample selector ] ]
			ifFound: [ :eachGtExampleWithResult | eachGtExampleWithResult ]
			ifNone: [ eachGtExample asExampleWithResult ] ].
]

{ #category : #enumerating }
GtExampleGroup >> do: aBlock [ 
	^ self examples do: aBlock
]

{ #category : #accessing }
GtExampleGroup >> erroredExamples [
	^ (self examples
		select: [ :eachExample | eachExample isError ])
			sorted: GtMethodsSortFunction new
]

{ #category : #accessing }
GtExampleGroup >> examples [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtExampleGroup >> executedExamples [
	^ (self examples
		select: [ :eachExample | eachExample hasResult ])
			sorted: GtMethodsSortFunction new
]

{ #category : #accessing }
GtExampleGroup >> failedExamples [
	^ (self examples
		select: [ :eachExample | eachExample isFailure ])
			sorted: GtMethodsSortFunction new
]

{ #category : #enumerating }
GtExampleGroup >> flatCollect: aBlock [
	^ self examples flatCollect: aBlock
]

{ #category : #enumerating }
GtExampleGroup >> groupedBy: aBlock [ 
	"we are reimplementing this method here and not reuse the one in collection
	because we want the keys to be groups, not simple collections"
	| result |
	result := Dictionary new.
	self do:
		[:each | | key collection |
		key := aBlock value: each.
		collection := result at: key ifAbsentPut: [ OrderedCollection new ].
		collection add: each].
	result keysAndValuesDo:
			[:key :value | result at: key put: (self species withAll: value)].
	^ result
]

{ #category : #accessing }
GtExampleGroup >> gtClassesFor: aView [ 
	<gtView>
	self examples ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'By class';
		items: [ (self examples groupedBy: [ :eachExample | 
			eachExample methodClass instanceSide ]) associations
				sorted: [ :a :b | a key name < b key name ] ];
		column: 'Class' item: [ :anAssoc | anAssoc key ];
		column: 'Number of examples' item: [ :anAssoc | anAssoc value size ];
		send: [ :anAssoc | anAssoc ifNotNil: [ anAssoc key ] ]
]

{ #category : #ui }
GtExampleGroup >> gtInspectorExamplesIn: composite [
	<gtInspectorPresentationOrder: 1>

	composite fastTreeTable
		title: 'Examples (' , self numberOfExamples gtDisplayString , ')';
		display: [ self examples ];
		icon: [ :each | each icon ];
		"sorted: [ :a :b | a statusText < b statusText ];"
		children: [ :each | self directDependenciesFor: each ];
		column: 'Status'
			evaluated: [ :each | '' ]
			width: 100
			tags: [ :each | {each statusText} ]
			sortedBy: [ :a :b | a statusText < b statusText ];
		column: 'Result'
			evaluated: [ :each | '' ]
			width: 120
			tags: [ :each | {each resultOrErrorName} ]
			sortedBy: [ :a :b | a resultOrErrorName < b resultOrErrorName ];
		column: 'Selector' 
			evaluated: [ :each | each example selector ];
		column: 'Class'
			evaluated: [ :each | '' ]
			tags: [ :each | { 
				each example methodClass instanceSide name. 
				each example methodProtocol } ]
			sortedBy: [ :a :b | 
				(a example methodClass instanceSide name 
				<= b example methodClass instanceSide name) and: [ 
					a example methodProtocol <= b example methodProtocol ] ];
		enableFilter: [ :example :pattern | 
			self matchesExampleWithResult: example withPattern: pattern ];
		selectionAct: [ :list | 
			list rawSelection run.
			list update.
			(list pane port: #toSelect) value: list rawSelection result returnValue ]
			on: $r
			entitled: 'Run';
		selectionAct: [ :list | 
			list rawSelection debug.
			list update ]
			on: $D
			entitled: 'Debug';
		send: [ :each | 
			(each isKindOf: GtExampleWithResult)
				ifTrue: [ each example ]
				ifFalse: [ each ] ];
		act: [ :v | self runAll.  v update ]
			icon: (Smalltalk ui iconNamed: #testGreen)
			entitled: 'Run All'.

]

{ #category : #accessing }
GtExampleGroup >> gtPackagesFor: aView [ 
	<gtView>
	self examples ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'By package';
		items: [ (self examples groupedBy: [ :eachExample | 
			eachExample methodPackage ]) associations ];
		column: 'Package' item: [ :anAssoc | anAssoc key ];
		column: 'Number of examples' item: [ :anAssoc | anAssoc value size ];
		send: [ :anAssoc | anAssoc ifNotNil: [ anAssoc key ] ]
]

{ #category : #testing }
GtExampleGroup >> hasAnnouncer [
	^ announcer isNotNil
]

{ #category : #testing }
GtExampleGroup >> ifEmpty: aBlockClosure [ 
	^ self examples ifEmpty: aBlockClosure 
]

{ #category : #testing }
GtExampleGroup >> ignoreAnnouncements [
	<return: #Boolean>
	^ ignoreAnnouncements
]

{ #category : #'announcement handling' }
GtExampleGroup >> ignoreAnnouncementsDuring: aBlock [
	ignoreAnnouncements := true.
	aBlock ensure: [ ignoreAnnouncements := false ].
]

{ #category : #initialization }
GtExampleGroup >> initialize [
	super initialize.
	ignoreAnnouncements := false.
]

{ #category : #testing }
GtExampleGroup >> isCollection [
	^ true
]

{ #category : #testing }
GtExampleGroup >> matchesExampleWithResult: aGtExampleWithResult withPattern: patternString [ 
	^ aGtExampleWithResult example selector 
			includesSubstring: patternString caseSensitive: false 
]

{ #category : #accessing }
GtExampleGroup >> numberOfErrors [
	^ self count: #isError
]

{ #category : #accessing }
GtExampleGroup >> numberOfExamples [
	^ self examples size
]

{ #category : #accessing }
GtExampleGroup >> numberOfFailures [
	^ self count: #isFailure
]

{ #category : #accessing }
GtExampleGroup >> numberOfFailuresAndErrors [
	^ self count: [ :eachExample | eachExample isFailure or: [ eachExample isError ] ]
]

{ #category : #accessing }
GtExampleGroup >> numberOfResults [
	^ self count: [ :eachExample | eachExample hasResult ]
]

{ #category : #accessing }
GtExampleGroup >> numberOfSuccesses [
	^ self count: [ :eachExample | eachExample isSuccess ]
]

{ #category : #'accessing - dynamic' }
GtExampleGroup >> results [
	^ self collect:  [ :example | example run ]
]

{ #category : #'accessing - dynamic' }
GtExampleGroup >> returnValues [
	^ self results collect: [ :result | result returnValue ]
]

{ #category : #actions }
GtExampleGroup >> runAll [
	self examples 
		do: [ :eachExampleWithResult | 
			eachExampleWithResult ignoreTest ifFalse: [ 
				self ignoreAnnouncementsDuring: [ eachExampleWithResult run ] ] ] 
		displayingProgress: 'Running examples ...'.
	self hasAnnouncer ifFalse: [ ^ self ].
	self announcer announce: (GtExamplesExecuted new group: self).
]

{ #category : #actions }
GtExampleGroup >> runNotYetExecuted [
	self examples 
		do: [ :each | 
			each ignoreTest ifFalse: [ 
				each hasResult ifFalse: [ each run ] ] ] 
		displayingProgress: 'Running examples ...'.
]

{ #category : #enumerating }
GtExampleGroup >> select: aBlock [
	^ self class withAll: (self examples select: aBlock)
]

{ #category : #accessing }
GtExampleGroup >> skippedExamples [
	^ (self examples
		reject: [ :eachExample | eachExample hasResult ])
			sorted: GtMethodsSortFunction new
]

{ #category : #accessing }
GtExampleGroup >> sortedExamples [
	^ self examples sorted: GtMethodsSortFunction new
]

{ #category : #accessing }
GtExampleGroup >> successfulExamples [
	^ (self examples
		select: [ :eachExample | eachExample isSuccess ])
			sorted: GtMethodsSortFunction new
]
