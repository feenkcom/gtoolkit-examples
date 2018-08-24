"
I am a test for manually checking that the inspector presentations work on all the examples objects in the system. I however exclude tests from some classes that can be problematic.

I maintain the list of classes for which examples were tested in an external file, so if the image crashed I can resume checking.

#run is the main entry point to the test

"
Class {
	#name : #GtInspectorExamplesManualTest,
	#superclass : #Object,
	#instVars : [
		'allFailures',
		'allClasses',
		'allTestedClasses',
		'allUntestedClasses'
	],
	#category : 'GToolkit-Tests-Examples-SUnit'
}

{ #category : #public }
GtInspectorExamplesManualTest class >> reset [
	FileSystem workingDirectory allFiles 
		select: [ :each | each basename beginsWith: 'gtExamples' ]
		thenDo: [ :each | each delete ]
]

{ #category : #private }
GtInspectorExamplesManualTest >> basicRunClasses [
	 self runClasses: allUntestedClasses 
]

{ #category : #private }
GtInspectorExamplesManualTest >> basicRunExample: anExample [
	self checkAllPresentationsOf: anExample onError: [ :aPragma :anException | 
		allFailures add: anExample method.
		self printException: anException forExample: anExample withPragma: aPragma ] 
]

{ #category : #private }
GtInspectorExamplesManualTest >> basicRunFailures [
	" self new runFailures "

	(allFailures := self readFailuresFromFile: (FileSystem workingDirectory / 'gtExamplesAllFailures.txt')) 
		do: [ :each |
			each gtExamples do: [ :example |
				self runExample: example ] ]
		displayingProgress: 'Running ', allFailures size asString, ' failures ...'
]

{ #category : #private }
GtInspectorExamplesManualTest >> checkAllPresentationsOf: exampleToTest onError: aBlock [
	| browser window |
	(Pragma allNamed: #gtInspectorPresentationOrder: from: exampleToTest class to: ProtoObject) do: [ :eachPragma | 
		browser := GLMWrapper new.
		[	browser
				show: [ :composite | 
					(eachPragma selector findTokens: $:) size = 1
						ifTrue: [ exampleToTest perform: eachPragma selector with: composite ].
					(eachPragma selector findTokens: $:) size = 2
						ifTrue: [ exampleToTest perform: eachPragma selector with: composite with: browser ] ].
			window := browser openOn: exampleToTest ] 
				on: Error 
				do: [ :exception |
					window ifNotNil: [ window delete ].
					aBlock value: eachPragma value: exception ].
		window ifNotNil: [ window delete ] ]
]

{ #category : #private }
GtInspectorExamplesManualTest >> examplesForClass: aClass [
	^ aClass gtExamples
]

{ #category : #private }
GtInspectorExamplesManualTest >> filenameFor: anExample [
	^ ((('gtExamplesFailure_', anExample method gtDisplayString		 
			copyReplaceAll: '>' with: '_') 
			copyReplaceAll: ':' with: '.') 
			copyReplaceAll: ' ' with: '') 
			copyReplaceAll: '#' with: ''
]

{ #category : #initialization }
GtInspectorExamplesManualTest >> initialize [
	| fileWithAllClasses fileWithAllTestedClasses |
	super initialize.
		
	" prepare all classes "
	allClasses := {}.
	fileWithAllClasses := FileSystem workingDirectory / 'gtExamplesAllClasses.txt'.
	fileWithAllClasses exists ifTrue: [ 
		allClasses := self readClassesFromFile: fileWithAllClasses ].
	allClasses isEmptyOrNil ifTrue: [
		| streamWithAllClasses |
		allClasses := SystemNavigation default allClassesAndTraits sort: [ :a :b | a name <= b name ].
		streamWithAllClasses := fileWithAllClasses writeStream.
		allClasses do: [ :each | streamWithAllClasses nextPutAll: each name; cr. ].
		streamWithAllClasses flush; close. ].

	" prepare tested classes "
	allTestedClasses := {}.
	fileWithAllTestedClasses := FileSystem workingDirectory / 'gtExamplesAllTestedClasses.txt'.
	fileWithAllTestedClasses exists ifTrue: [ 
		allTestedClasses := self readClassesFromFile: fileWithAllTestedClasses ].
	
	" prepare untested classes "
	allUntestedClasses := (allClasses difference: allTestedClasses) sort: [ :a :b | a name <= b name ].
	
	" prepare failures "
	allFailures := self readFailuresFromFile: (FileSystem workingDirectory / 'gtExampleAllFailures.txt').
]

{ #category : #private }
GtInspectorExamplesManualTest >> printException: anException forExample: anExample withPragma: aPragma [
	(FileSystem workingDirectory / 'gtExamplesAllFailures.txt') writeStream 
		setToEnd; cr;
		nextPutAll: anExample method gtDisplayString; cr;
		flush;
		close.
	(FileSystem workingDirectory / (self filenameFor: anExample)) writeStream 
		truncate;
		nextPutAll: anExample gtDisplayString; cr;
		nextPutAll: aPragma gtDisplayString; cr;
		nextPutAll: anException asString; cr;
		nextPutAll: '--------------------------------------------------------------------------------'; cr;
		nextPutAll: (String streamContents: [ :stream | 
							anException signalerContext ifNotNil: [ :context | 
								context debugStackOn: stream ] ] );
		flush;
		close
]

{ #category : #private }
GtInspectorExamplesManualTest >> readClassesFromFile: aFile [
	aFile exists ifFalse: [ ^ OrderedCollection new ].
	^ ((aFile readStream contents splitOn: String cr) 
		collect: [ :each | [ Smalltalk classNamed: each trimBoth ] on: Error do: [ nil ] ]) 
		reject: [ :each | each isNil ]
]

{ #category : #private }
GtInspectorExamplesManualTest >> readFailuresFromFile: aFile [
	aFile exists ifFalse: [ ^ OrderedCollection new ].
	^ (((aFile readStream contents splitOn: String cr)
		collect: [ :each | [ Smalltalk compiler evaluate: each trimBoth ] on: Error do: [ nil ] ])
		reject: [ :each | each isNil ]) asSet asOrderedCollection
]

{ #category : #public }
GtInspectorExamplesManualTest >> run [
	" self new run "
	
	self run: [ self basicRunClasses ]
]

{ #category : #private }
GtInspectorExamplesManualTest >> run: aBlock [
	
	[ "GTExampleOrganizer instance stop." aBlock value ]
		ensure: [ "GTExampleOrganizer instance start" ].
	
	self verify
]

{ #category : #private }
GtInspectorExamplesManualTest >> runClasses: aCollectionOfClasses [
	aCollectionOfClasses
		do:
			[ :class | 
			(self examplesForClass: class) do: [ :example | self runExample: example ] displayingProgress: class name.
			(FileSystem workingDirectory / 'gtExamplesAllTestedClasses.txt') writeStream
				setToEnd;
				cr;
				nextPutAll: class name;
				flush;
				close ]
		displayingProgress: 'Running examples of ' , aCollectionOfClasses size asString , ' classes ...'
]

{ #category : #private }
GtInspectorExamplesManualTest >> runExample: anExample [
	[ self basicRunExample: anExample ]
		on: Error
		do: [ :exception | 
			allFailures add: anExample method.
			self printException: exception forExample: anExample withPragma: nil ] 
]

{ #category : #public }
GtInspectorExamplesManualTest >> runFailures [
	" self new runFailures "
	
	self run: [ self basicRunFailures ]
]

{ #category : #private }
GtInspectorExamplesManualTest >> verify [
	self assert: allFailures isEmptyOrNil description: (String streamContents: [ :stream |
		allFailures do: [ :each | 
			stream nextPutAll: each gtDisplayString; cr ] ] )
]
