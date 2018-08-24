Class {
	#name : #GtInspectorExamplesTest,
	#superclass : #TestCase,
	#instVars : [
		'pragmas'
	],
	#category : 'GToolkit-Tests-Examples-SUnit'
}

{ #category : #running }
GtInspectorExamplesTest >> allExamples [
	" IMPORTANT NOTICE 
	1) We expicitly exclude examples from Roassal and Woden. Running all of those examples at once will severely slow down all tests and eventually cause segmentation faults - crash of image. This is not a fault/bug of GTExample - it happens also if the GTExample-wrapper is not used at all ! "
	^ Smalltalk gtExamplesContained reject: [ :each | 
		each ignoreTest
			or: [ each ignoreTestReport
				or: [ { 'RT'. 'RW' } anySatisfy: [ :prefix | 
									each methodClass name beginsWith: prefix ] ] ] ]
]

{ #category : #running }
GtInspectorExamplesTest >> checkAllPresentationsOf: exampleToTest [
	| browser window |
	exampleToTest class name = #ProtoObject ifTrue: [ ^ self ]. " no longer implemented "
	(Pragma
		allNamed: #gtInspectorPresentationOrder:
		from: exampleToTest class
		to: ProtoObject)
		do: [ :eachPragma | 
			browser := GLMWrapper new.
			[ browser
				show: [ :composite | 
					(eachPragma methodSelector findTokens: $:) size = 1
						ifTrue: [ exampleToTest perform: eachPragma methodSelector with: composite ].
					(eachPragma methodSelector findTokens: $:) size = 2
						ifTrue: [ exampleToTest
								perform: eachPragma methodSelector
								with: composite
								with: browser ] ].
			window := browser openOn: exampleToTest ]
				on: Error
				do: [ window ifNotNil: [ window delete ].
					self
						fail:
							eachPragma method gtDisplayString , ' for '
								, exampleToTest gtDisplayString ].
			window ifNotNil: [ window delete ] ]
]

{ #category : #running }
GtInspectorExamplesTest >> pragmasFor: exampleToTest [
	^ pragmas 
		at: exampleToTest class 
		ifAbsentPut: [ Pragma allNamed: #gtInspectorPresentationOrder: from: exampleToTest class to: Object ]
]

{ #category : #running }
GtInspectorExamplesTest >> setUp [
	super setUp.
	
	pragmas := IdentityDictionary new.
]

{ #category : #running }
GtInspectorExamplesTest >> tearDown [
	super tearDown.
	
	pragmas := nil.
]

{ #category : #tests }
GtInspectorExamplesTest >> testAllExamples [
	| examples |
	
	self timeLimit: 15 minutes.
	
	(examples := self allExamples)
		do: [ :exampleToTest | self checkAllPresentationsOf: exampleToTest returnValue ]
		displayingProgress: 'Running ', examples size asString, ' Examples for Inspector-Presentations'
]

{ #category : #tests }
GtInspectorExamplesTest >> testGlobals [
	| globals |
	(globals := { Smalltalk . RBMessageNode . Trait . TClass . TBehavior . GTInspector . Object . Class . CompiledMethod })
		do: [ :each | self checkAllPresentationsOf: each ]
		displayingProgress: 'Running ', globals size asString, ' globals for Inspector-Presentations'
]
