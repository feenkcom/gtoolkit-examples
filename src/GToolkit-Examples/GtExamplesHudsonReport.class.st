"
I create a Hudson report by running examples from a given list of packages. Apart from running an example, if it is a success, I also try to run all inspector presentations for the return value of the example.
"
Class {
	#name : #GtExamplesHudsonReport,
	#superclass : #GtExamplesTestingHudsonReport,
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #running }
GtExamplesHudsonReport class >> runPackage: aString [
	^ self new 
		initializeWithTestCases: (RPackage organizer packageNamed: aString) gtExamplesAllContained ;
		reportName: aString;
		run
]

{ #category : #running }
GtExamplesHudsonReport class >> runPackages: aCollectionOfStrings [
	^ aCollectionOfStrings collect: [ :each | 
		self runPackage: each ]
]

{ #category : #'accessing - test case' }
GtExamplesHudsonReport >> containerNameFor: anExample [
	| categoryName |
	categoryName := anExample methodClass category copyReplaceAll: '-' with: '.'.
	^ categoryName
		, '.'
		, anExample methodClass name
]

{ #category : #'accessing - test case' }
GtExamplesHudsonReport >> loggingNameFor: anExample [
	^ anExample gtDisplayString
]

{ #category : #'accessing - test case' }
GtExamplesHudsonReport >> nameFor: anExample [
	^ anExample selector
]

{ #category : #accessing }
GtExamplesHudsonReport >> resultsFileName [
	^ self reportName , '-Examples.xml'
]

{ #category : #running }
GtExamplesHudsonReport >> runExample: anExample [
	| error stack |
	self
		beginTestCase: anExample
		runBlock: [
			[ anExample debug ]
				on: self signalableExceptions
				do: [ :err | 
					error := err.
					(anExample exceptions handles: err)
						ifFalse: [ 
							stack := self stackTraceString: err of: anExample ] ] ].
	
	error ifNotNil: [
		(error isKindOf: AssertionFailure)
			ifTrue: [ self writeFailure: error stack: stack ]
			ifFalse: [ self writeError: error stack: stack ] ].
	
	self endTestCase
]

{ #category : #running }
GtExamplesHudsonReport >> runTestCase: anExample [
	^ self runExample: anExample
]

{ #category : #private }
GtExamplesHudsonReport >> stackTraceString: err of: anExample [
	^ String streamContents: [ :str | 
		| context |
		context := err signalerContext.
		[ context isNil 
			or: [  
				(context methodSelector == #primitiveProcessExample:withEvaluationContext: and: [ 
					context arguments first = anExample ])
					or: [ context receiver = anExample and: [ context methodSelector = #debug ] ] ] 
		] whileFalse: [
			str print: context; lf.
			context := context sender ] ] 
]

{ #category : #accessing }
GtExamplesHudsonReport >> testCasesToRun [
	^ self testCases reject: [ :anExample | 
		anExample ignoreTest ]
]
