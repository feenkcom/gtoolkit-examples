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
	| theExamples theExamplesGroupedByClass |
	
	"Running all examples in the image may create a lot of objects,
	to make it a bit more predictable we request gargabe collection manually."
	Smalltalk garbageCollect.

	theExamples := (RPackage organizer packageNamed: aString) gtExamplesAllContained.
	theExamplesGroupedByClass := theExamples groupedBy: [ :each | each methodClass ].

	GtExamplesReportRunPackageSignal new
		packageName: aString;
		amountOfExampleClasses: theExamplesGroupedByClass size;
		amountOfExamples: theExamples size;
		emit.

	^ theExamplesGroupedByClass associations collect: [ :eachAssoc |
		| eachClass classExamples sortFunction |
		
		eachClass := eachAssoc key.
		classExamples := eachAssoc value.
		
		sortFunction := GtMethodsSortFunction new.
		classExamples := classExamples sorted: [ :a :b |
			(sortFunction collate: a method with: b method) <= 0 ].

		GtExamplesReportRunClassSignal new
			exampleClass: eachClass;
			amountOfExamples: classExamples size;
			emit.

		self new 
			initializeWithTestCases: classExamples;
			reportName: aString, '-', eachClass name;
			run ]
]

{ #category : #running }
GtExamplesHudsonReport class >> runPackages: aCollectionOfStrings [
	^ aCollectionOfStrings flatCollect: [ :each | self runPackage: each ]
]

{ #category : #'accessing - test case' }
GtExamplesHudsonReport >> containerNameFor: anExample [
	| categoryName |
	categoryName := anExample providerClass category copyReplaceAll: '-' with: '.'.
	^ categoryName
		, '.'
		, anExample providerClass name
]

{ #category : #'accessing - test case' }
GtExamplesHudsonReport >> loggingNameFor: anExample [
	^ anExample gtDisplayString
]

{ #category : #'accessing - test case' }
GtExamplesHudsonReport >> nameFor: anExample [
	^ anExample selector
]

{ #category : #private }
GtExamplesHudsonReport >> progressFileName [
	^ 'progress-examples.log'
]

{ #category : #accessing }
GtExamplesHudsonReport >> resultsFileName [
	^ self reportName , '-Examples.xml'
]

{ #category : #running }
GtExamplesHudsonReport >> runExample: anExample [
	| error stack |
	
	GtExamplesReportRunExampleSignal new
		example: anExample;
		emit.

	self
		beginTestCase: anExample
		runBlock: [
			[ anExample debug ]
				on: self signalableExceptions
				do: [ :err | 
					error := err freeze.
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
				| hasExampleOnTheStack |
				
				"Checking `object isKindOf: anExample class` may look excessive because we have an equality check `=`,
				however, since `=` can be overriden by ccustom objects there is no guarantee that the implementation
				of the equality method is sound and will not produce new errors. That is why we first make sure we deal with
				an instance of GtExample for which we can guarantee the correctness of the `=`"
				hasExampleOnTheStack :=
					context methodSelector = #primitiveProcessExample:withEvaluationContext:
						and: [ (context arguments first isKindOf: anExample class)
							and: [ context arguments first = anExample ] ].

				hasExampleOnTheStack := hasExampleOnTheStack or: [
					(context receiver isKindOf: anExample class)
						and: [ context receiver = anExample
							and: [ context methodSelector = #debug ] ] ].
				hasExampleOnTheStack ]
		] whileFalse: [
			str print: context; lf.
			context := context sender ] ] 
]

{ #category : #accessing }
GtExamplesHudsonReport >> testCasesToRun [
	^ self testCases reject: [ :anExample | 
		anExample ignoreTest ]
]
