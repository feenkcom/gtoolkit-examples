"
I create a Hudson report by running examples from a given list of packages. Apart from running an example, if it is a success, I also try to run all inspector presentations for the return value of the example.


"
Class {
	#name : #GtExamplesHudsonReport,
	#superclass : #GtExamplesTestingHudsonReport,
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #running }
GtExamplesHudsonReport class >> runClass: aClass [
	| theExamples theExamplesGroupedByClass |

	theExamples := aClass gtExamples.
	theExamplesGroupedByClass := theExamples groupedBy: [ :each | each methodClass ].

	GtExamplesReportRunPackageSignal new
		packageName: aClass package name;
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
			reportName: aClass package name, '-', eachClass name;
			run ]
]

{ #category : #running }
GtExamplesHudsonReport class >> runPackage: aString [
	| theExamples theExamplesGroupedByClass |

	theExamples := (self packageOrganizer packageNamed: aString) gtExamplesAllContained.
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
	categoryName := anExample receiverClass category copyReplaceAll: '-' with: '.'.
	^ categoryName
		, '.'
		, anExample receiverClass name
]

{ #category : #running }
GtExamplesHudsonReport >> emitRetrySignalFor: anExample exception: anException retryCount: aRetryCount [
	GtExamplesReportRetrySignal new
		example: anExample;
		exception: anException;
		retryCount: aRetryCount;
		emit
]

{ #category : #running }
GtExamplesHudsonReport >> fuelOutTheError: error of: anExample [
	| fileName className methodName |
	[
		className := anExample methodClass name.
		methodName := anExample selector copyReplaceAll: ':' with: '-'.
		fileName := className, '-', methodName, '.fuel'.
		FLSerializer serialize: error signalerContext toFileNamed: fileName 
	] on: Error do: [:e | 
		GtExamplesReportExceptionSignal  new 
			error: e; 
			message: 'Unable to fuel out the error';
			emit
	]
]

{ #category : #running }
GtExamplesHudsonReport >> initializeErrorDetails: errorDetails  forError: anError [
	| errorMessage |
	errorDetails at: #errorClass put: anError class.

	errorMessage := anError messageText.
	(errorMessage isNil or: [ errorMessage isEmpty ]) ifTrue: [ 
		errorMessage := anError description ].
	errorDetails at: #errorMessage put: errorMessage
]

{ #category : #'accessing - test case' }
GtExamplesHudsonReport >> loggingNameFor: anExample [
	^ anExample gtDisplayString
]

{ #category : #'accessing - test case' }
GtExamplesHudsonReport >> nameFor: anExample [
	^ anExample selector
]

{ #category : #running }
GtExamplesHudsonReport >> prepareForRetryOf: anExample [
	"Give the system a chance to recover before the next attempt of anExample.
	I run after the failed attempt has unwound, so the watchdog of the execution environment does not interrupt me"

	3 timesRepeat: [ Smalltalk garbageCollect ].
	3 seconds wait
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
GtExamplesHudsonReport >> runAttemptOf: anExample isLastAttempt: isLastAttempt addingStackTo: aCollectionOfStacks [
	"Run anExample once. Answer the signalled exception, or nil if anExample succeeded.
	The handler only records the stack and returns, so the stack unwinds and the execution environment
	marks anExample as completed (its watchdog stops) before any slow work, like #prepareForRetryOf:, starts.
	A late TestTookTooMuchTime signalled while the stack is recorded is ignored, so it cannot escape the handler."

	^ [ anExample debug.
	nil ]
		on: self signalableExceptions
		do: [ :anError | 
			[ (isLastAttempt not or: [ (anExample exceptions handles: anError) not ])
				ifTrue: [ aCollectionOfStacks add: (self stackTraceString: anError of: anExample) ] ]
				on: TestTookTooMuchTime
				do: [ :aTimeout | aTimeout return: nil ].
			anError return: anError ]
]

{ #category : #running }
GtExamplesHudsonReport >> runExample: anExample [
	| errorDetails stacks runStatus retryCount lastError |

	errorDetails := nil.
	retryCount := 3.
	stacks := OrderedCollection new.

	"Retry only after a failed attempt has unwound: until then the watchdog of the execution environment
	keeps signalling TestTookTooMuchTime, which would escape a handler doing slow work"
	self beginTestCase: anExample runBlock: [ 
		[ lastError := self
				runAttemptOf: anExample
				isLastAttempt: retryCount <= 1
				addingStackTo: stacks.
		lastError notNil and: [ 
			retryCount := retryCount - 1.
			self emitRetrySignalFor: anExample exception: lastError retryCount: retryCount.
			retryCount > 0 ] ]
				whileTrue: [ self prepareForRetryOf: anExample ].
		lastError ifNotNil: [ 
			errorDetails := Dictionary new.
			self initializeErrorDetails: errorDetails forError: lastError ] ].

	errorDetails 
		ifNil: [ runStatus := #success ]
		ifNotNil: [ 
			| stackReport |
			stackReport := stacks size = 1
				ifTrue: [ stacks first ]
				ifFalse: [
					String streamContents: [ :aStream |
						| stackIndex |
						stackIndex := 1.
						stacks 
							do: [ :aStack | 
								aStream 
									<< 'Stack ';
									print: stackIndex;
									lf;
									<< aStack.
								stackIndex := stackIndex +1  ]
							separatedBy: [
								aStream lf; lf ] ] ].
		
			((errorDetails at: #errorClass) includesBehavior: AssertionFailure)
				ifTrue: [ 
					 runStatus := #failure.
					self writeFailure: errorDetails stack: stackReport ]
				ifFalse: [
					runStatus := #error.
					self writeError: errorDetails stack: stackReport ] ].

	self endTestCase.
	
	GtExamplesReportRunExampleSignal new
		example: anExample;
		runStatus: runStatus;
		emit.
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
					context selector = #primitiveProcessExample:withEvaluationContext:
						and: [ (context arguments first isKindOf: anExample class)
							and: [ context arguments first = anExample ] ].

				hasExampleOnTheStack := hasExampleOnTheStack or: [
					(context receiver isKindOf: anExample class)
						and: [ context receiver = anExample
							and: [ context selector = #debug ] ] ].
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
