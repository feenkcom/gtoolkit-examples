Extension { #name : #GtExample }

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtDebuggerSourceIn: composite [
	<gtDebuggerPresentationOrder: 1>
	self exists ifFalse: [ ^ self ].
	^ (self method gtInspectorSourceIn: composite)
		title: 'Method'
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtDisplayOn: aStream [
	self label isEmptyOrNil 
		ifTrue: [ 
			aStream 
				print: self methodClass; 
				nextPutAll: ' >> '; 
				print: self selector ]
		ifFalse: [ 
			aStream nextPutAll: self label ].
		
	self gtDisplayValidityOn: aStream
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtDisplayValidityOn: aStream [
	self isValid ifTrue: [ ^ self ].
	
	aStream nextPutAll: ' [invalid]'
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtInspectorActionReturnValue [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :p | p selection: (self runThenDo: [ :r | r returnValue ] onErrorDo: [ :r | r ]) ];
		icon: (Smalltalk ui icons iconNamed: #glamorousGo);
		title: 'Evaluate and inspect return-value'
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtInspectorActionSubjects [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ GtExampleNavigation browseAllExampleSubjects: { self } ];
		icon: (Smalltalk ui icons iconNamed: #glamorousBookmark);
		title: 'Subjects'
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtInspectorAfterIn: composite [
	<gtInspectorPresentationOrder: 3>
	self hasAfter ifFalse: [ ^ self ].
	^ ({ self after } gtInspectorItemsIn: composite)
			title: 'After'
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtInspectorDependenciesIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ self directDependencies 
		ifEmpty: [ self ] 
		ifNotEmpty: [ :aCollection | 
			(aCollection asOrderedCollection gtInspectorItemsIn: composite)
				title: 'Dependencies' ]
	
	
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtInspectorProblemsIn: composite [
	<gtInspectorPresentationOrder: 5>
	self hasProblems ifFalse: [ ^ self ].
	^ (self problems gtInspectorItemsIn: composite)
			title: 'Problems'
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtInspectorSourceIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ (self method asRingDefinition gtInspectorSourceIn: composite)
		title: 'Source'
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtInspectorSubjectsIn: composite [
	<gtInspectorPresentationOrder: 4>
	self hasSubjects ifFalse: [ ^ self ].
	^ (self subjects gtInspectorItemsIn: composite)
			title: 'Subjects'
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtSpotterAfterFor: aStep [
	<spotterOrder: 3>
	self hasAfter ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Example After';
		items: [ { self after } ];
		itemName: [ :example | example gtDisplayString ];
		filter: GTFilterSubstring
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtSpotterDependenciesFor: aStep [
	<spotterOrder: 1>
	self hasDependencies ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Example Dependencies';
		items: [ self directDependencies ];
		itemName: [ :example | example gtDisplayString ];
		filter: GTFilterSubstring
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtSpotterGTExampleSubjectsFor: aStep [
	<spotterOrder: 4>
	self hasSubjects ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Example Subjects';
		items: [ self subjects asArray ];
		itemName: [ :subject | subject gtDisplayString ];
		filter: GTFilterSubstring
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtSpotterMethodFor: aStep [
	<spotterOrder: 0>
	self exists ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Method';
		items: [ Array with: self method ];
		itemName: [ :aSource | aSource gtDisplayString ];
		filter: GTFilterSubstring
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtSpotterPreviewIn: aComposite [
	<spotterPreview: 1>
	self exists ifFalse: [ ^ self ].
	
	aComposite pharoMethod
		title: [ self gtDisplayString ]; 
		display: [ :entity | entity method sourceCode ];
		smalltalkClass: [ self method methodClass ];
		entity: self
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> gtSpotterProblemsFor: aStep [
	<spotterOrder: 5>
	self hasProblems ifFalse: [ ^ self ].
	aStep listProcessor
		title: 'Example Problems';
		items: [ self problems ];
		itemName: [ :problem | problem gtDisplayString ];
		filter: GTFilterSubstring
]

{ #category : #'*GToolkit-Examples-UI' }
GtExample >> spotterPreviewIn: aComposite inContext: aSpotter [
	^ self gtSpotterPreviewIn: aComposite
]
