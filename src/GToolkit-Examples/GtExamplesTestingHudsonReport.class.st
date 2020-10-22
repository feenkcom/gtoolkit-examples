Class {
	#name : #GtExamplesTestingHudsonReport,
	#superclass : #GtExamplesBasicHudsonReport,
	#instVars : [
		'reportName',
		'testCases',
		'progressStream',
		'resultsStream',
		'resultSummaryPosition',
		'executionTime',
		'errorCount',
		'failureCount',
		'executedCount'
	],
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #private }
GtExamplesTestingHudsonReport >> beginTestCase: aTestCase runBlock: aBlock [
	| time |
	executedCount := executedCount + 1.
	
	progressStream 
		nextPutAll: 'Starting: ';
		nextPutAll: (self loggingNameFor: aTestCase);
		nextPutAll: ' ... '; 
		flush.
	
	time := aBlock timeToRun.
	
	resultsStream tab; 
		nextPutAll: '<testcase'; 
		nextPutAll: ' classname="'; 
			nextPutAll: (self encode: (self containerNameFor: aTestCase));
			nextPutAll: '"'; 
		nextPutAll: ' name="'; 
			nextPutAll: (self encode: (self nameFor: aTestCase)); 
			nextPutAll: '"'; 
		nextPutAll: ' time="'; print: (time asMilliSeconds / 1000.0); 
		nextPutAll: '">'; 
		lf
	

]

{ #category : #'accessing - test case' }
GtExamplesTestingHudsonReport >> containerNameFor: anExample [
	^ self subclassResponsibility
]

{ #category : #running }
GtExamplesTestingHudsonReport >> end [
	resultsStream tab; nextPutAll: '<system-out><![CDATA[]]></system-out>'; lf.
	resultsStream tab; nextPutAll: '<system-err><![CDATA[]]></system-err>'; lf.
	resultsStream nextPutAll: '</testsuite>'.
	
	resultsStream wrappedStream position: resultSummaryPosition.
	resultsStream 
		nextPutAll: ' failures="'; print: self failureCount; 
		nextPutAll: '" errors="'; print: self errorCount; 
		nextPutAll: '" time="'; print: executionTime asMilliSeconds / 1000.0; 
		nextPutAll: '">'.
	resultsStream close.
	
	progressStream 
		nextPutAll: ('Finished running {1}: ' format: {self class name});
		nextPutAll: self reportName;
		close
]

{ #category : #private }
GtExamplesTestingHudsonReport >> endTestCase [
	resultsStream tab; nextPutAll: '</testcase>'; lf.
	progressStream nextPutAll: 'finished' ; crlf; flush.
]

{ #category : #private }
GtExamplesTestingHudsonReport >> ensureProgressFile [
	| aFile |
	aFile := File named: 'progress-constraints.log'.
	aFile delete.
	progressStream := ZnCharacterWriteStream
		on: (aFile writeStream 
			setToEnd; 
			yourself)
		encoding: 'utf8'.
]

{ #category : #private }
GtExamplesTestingHudsonReport >> ensureResultsFile [
	| aFile |
	aFile := File named: self resultsFileName.
	aFile delete.
	resultsStream := ZnCharacterWriteStream
		on: (aFile writeStream setToEnd; yourself)
		encoding: 'utf8'.
]

{ #category : #private }
GtExamplesTestingHudsonReport >> ensureStreamsClosed [
	[ resultsStream ifNotNil: [ resultsStream close ] ] 
		on: Error 
		do: [ :anError |  Stdio stderr print: anError ].
	[ progressStream ifNotNil: [ progressStream close ] ] 
		on: Error 
		do: [ :anError |  Stdio stderr print: anError ].
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> errorCount [
	^ errorCount
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> executedCount [ 
	^ executedCount
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> failureCount [
	^ failureCount
]

{ #category : #testing }
GtExamplesTestingHudsonReport >> hasErrors [ 
	^ self errorCount > 0
]

{ #category : #testing }
GtExamplesTestingHudsonReport >> hasFailures [ 
	^ self failureCount > 0
]

{ #category : #initialization }
GtExamplesTestingHudsonReport >> initialize [
	super initialize.
	executionTime := 0 asDuration.
	
	executedCount := 0.
	failureCount := 0.
	errorCount := 0.
]

{ #category : #initialization }
GtExamplesTestingHudsonReport >> initializeWithTestCases: aCollection [
	testCases := aCollection
]

{ #category : #'accessing - test case' }
GtExamplesTestingHudsonReport >> loggingNameFor: anExample [
	^ self subclassResponsibility
]

{ #category : #'accessing - test case' }
GtExamplesTestingHudsonReport >> nameFor: anExample [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> passingCount [
	^ self executedCount - self failureCount - self errorCount
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> reportName [
	^ reportName
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> reportName: aString [
	reportName := aString
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> resultsFileName [
	^ self subclassResponsibility
]

{ #category : #running }
GtExamplesTestingHudsonReport >> run [
	Author uniqueInstance
		ifUnknownAuthorUse: 'hudson'
		during: [ 
			[ 
				self setUp.
				executionTime := [ self runAll ] timeToRun ]
			ensure: [ 
				self tearDown ] ]
]

{ #category : #running }
GtExamplesTestingHudsonReport >> runAll [
	CurrentExecutionEnvironment runTestsBy: [ 
		self testCasesToRun do: [ :each |  
			self runTestCase: each ] ]
]

{ #category : #running }
GtExamplesTestingHudsonReport >> runTestCase: anExample [
	self subclassResponsibility
]

{ #category : #running }
GtExamplesTestingHudsonReport >> setUp [
	self ensureResultsFile.
	self ensureProgressFile.
	
	self startFor: self testCases.
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> signalableExceptions [ 
	^ ExceptionSet new ,
		Halt ,
		Error ,
		TestFailure
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> skippedCount [
	^ self totalCount - self executedCount
]

{ #category : #running }
GtExamplesTestingHudsonReport >> startFor: examplesToTest [

	resultsStream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; lf.
	resultsStream 
		nextPutAll: '<testsuite '; 
			nextPutAll: 'name="'; nextPutAll: (self encode: self reportName); 
			nextPutAll: '" tests="'; print: examplesToTest size; 
		nextPutAll: '">'.
	
	"Now this is ugly. We want to update the time and the number of failures and errors, but still at the same time stream a valid XML. So remember this position and add some whitespace, that we can fill later."
	resultSummaryPosition := resultsStream wrappedStream position - 1.
	resultsStream nextPutAll: (String new: 100 withAll: Character space); lf.
]

{ #category : #running }
GtExamplesTestingHudsonReport >> tearDown [
	self end. 
	self ensureStreamsClosed
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> testCases [
	^ testCases
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> testCasesToRun [
	^ self testCases 
]

{ #category : #accessing }
GtExamplesTestingHudsonReport >> totalCount [
	^ self testCases size
]

{ #category : #private }
GtExamplesTestingHudsonReport >> writeError: error stack: stack [
	errorCount := errorCount + 1.
	resultsStream tab; tab; nextPutAll: '<error type="'.
	self writeException: error stack: stack.
	resultsStream nextPutAll: '</error>'; lf
]

{ #category : #private }
GtExamplesTestingHudsonReport >> writeException: error stack: stack [.
	resultsStream 
		nextPutAll: (self encode: error class name); 
		nextPutAll: '" message="'; nextPutAll: (self encode: (error messageText ifNil: [ error description ])); 
		nextPutAll: '">'; 
		nextPutAll: (self encode: stack).
]

{ #category : #private }
GtExamplesTestingHudsonReport >> writeFailure: error stack: stack [
	failureCount := failureCount + 1.
	resultsStream tab; tab; nextPutAll: '<failure type="'.
	self writeException: error stack: stack.  
	resultsStream	nextPutAll: '</failure>'; lf
]
