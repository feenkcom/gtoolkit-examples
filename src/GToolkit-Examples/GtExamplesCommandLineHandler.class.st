"
I am a command line handler for executing examples as tests. I take as input a list of packages and execute all examples defined in classes from  those packages.


"
Class {
	#name : #GtExamplesCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #accessing }
GtExamplesCommandLineHandler class >> checksLabel [
	^ 'Example'
]

{ #category : #accessing }
GtExamplesCommandLineHandler class >> commandName [
	^ 'examples'
]

{ #category : #accessing }
GtExamplesCommandLineHandler class >> description [
	^ 'A command line example runner'
]

{ #category : #activation }
GtExamplesCommandLineHandler >> activate [
	| theResults |

	self activateHelp
		ifTrue: [  ^ self ].

	(self hasOption: 'disable-deprecation-rewrites')
		ifTrue: [ Deprecation activateTransformations: false ].

	theResults := self runPackages.
	theResults ifNil: [
		^ self exitFailureAfterRun: 'There was an Error running examples' ].
	
	(self hasOption: 'save')
		ifTrue: [ Smalltalk saveSession ].
		
	((self hasOption: 'fail-on-no-tests-executed') 
		and: [ theResults allSatisfy: #hasNoExecutedTestCases ])
		ifTrue: [ ^ self exitFailureAfterRun: 'No tests were executed!' ].
	
	((self hasOption: 'fail-on-failure') 
		and: [ theResults anySatisfy: #hasFailuresOrErrors ])
		ifTrue: [ ^ self exitFailureAfterRun: 'Tests do not pass!' ].

	((self hasOption: 'fail-on-error') 
		and: [ theResults anySatisfy: #hasErrors ])
		ifTrue: [ ^ self exitFailureAfterRun: 'Tests do not pass!' ].
	
	(self hasOption: 'no-quit')
		ifFalse: [ self quitAfterRun ]
]

{ #category : #accessing }
GtExamplesCommandLineHandler >> addPackagesMatching: aString to: aSet [
	| regex |
	
	[ regex := aString asRegex ] 
		on: Error do: [ ].
	regex ifNotNil: [ ^ self addPackagesMatchingRegex: regex to: aSet ].
	
	(aString includes: $*)
		ifTrue: [ ^ self addPackagesMatchingGlob: aString to: aSet ].
	
	"exact match, and just those who actually have classes inside (to avoid 
	 super-package duplications)"
	((self packageOrganizer includesPackageNamed: aString) 
		and: [ (self packageOrganizer packageNamed: aString) definedClasses notEmpty ])
		ifTrue: [ aSet add: aString ]
]

{ #category : #accessing }
GtExamplesCommandLineHandler >> addPackagesMatchingGlob: aGlobString to: aSet [
	self packageOrganizer packageNames do: [ :packageName|
		(aGlobString match: packageName)
			ifTrue: [ aSet add: packageName ]]
]

{ #category : #accessing }
GtExamplesCommandLineHandler >> addPackagesMatchingRegex: aRegex to: aSet [
	self packageOrganizer packageNames do: [ :packageName|
		(aRegex matches: packageName)
			ifTrue: [ aSet add: packageName ]]
]

{ #category : #private }
GtExamplesCommandLineHandler >> basicRunExamplesInPackages: aCollectionOfPackages [
	^ self runWithVmStatistics: [
		self runWithMessageTally: [
			self exampleReport runPackages: aCollectionOfPackages ] ]
]

{ #category : #private }
GtExamplesCommandLineHandler >> exampleReport [
	(self hasOption: 'junit-xml-output') ifTrue: [ ^ GtExamplesHudsonReport ].
	^ self error: 'only works for now for junit for now'
]

{ #category : #'private - quitting' }
GtExamplesCommandLineHandler >> exitFailureAfterRun: aMessage [
	"Quit with a failure status, whether or not a windowing event loop is running.

	The counterpart of ${method:GtExamplesCommandLineHandler>>#quitAfterRun}$, and needed for the same
	reason: ${method:CommandLineHandler>>#exitFailure:}$ signals an `Exit` that leaves a running loop
	alive, so a failing run would hang instead of failing, which is worse than the success case.

	The message is written here because the `Exit` handler that would normally report it is bypassed, and
	the exit status is preserved so a caller can still tell failure from success."
	self hasWindowingEventLoop ifFalse: [ ^ self exitFailure: aMessage ].

	self stderr
		nextPutAll: aMessage;
		nextPutAll: OSPlatform current lineEnding;
		flush.

	BlHost pickHost universe postpone: [ Smalltalk exitFailure ]
]

{ #category : #'private - quitting' }
GtExamplesCommandLineHandler >> hasWindowingEventLoop [
	"Answer whether this image was started with a windowing event loop, as `--interactive` does.

	This is the same test ${method:GtTextEditorLibrary class>>#canRunExamples}$ uses to decide whether an
	example that renders an element can run at all, which is deliberate: the runs that need the special
	shutdown below are exactly the runs in which such examples execute."
	<return: #Boolean>
	^ RustWindowingEventFetcher default isNotNil
]

{ #category : #private }
GtExamplesCommandLineHandler >> inform: aString [

	self stdout 
		<< DateAndTime now printString;
		<< ': ';
		<< aString;
		<< OSPlatform current lineEnding
]

{ #category : #private }
GtExamplesCommandLineHandler >> informResults: anExamplesReportResult [
	| results |
	results := anExamplesReportResult exampleResults.
	self stdout 
		<< OSPlatform current lineEnding
		<< ('{1} examples, {2} executed, {3} passes, {4} failures, {5} errors, {6} skipped.'
			format: {
				results sumNumbers: #totalCount.
				results sumNumbers: #executedCount.
				results sumNumbers: #passingCount.
				results sumNumbers: #failureCount.
				results sumNumbers: #errorCount.
				results sumNumbers: #skippedCount });
		<< OSPlatform current lineEnding.
		
	anExamplesReportResult runtimeStatisticsDiffReport ifNotNil: [
		NonInteractiveTranscript stdout 
			<< OSPlatform current lineEnding;
			<< self class checksLabel capitalized pluralize;
			<< ' - Virtual Machine Statistics';
			<< OSPlatform current lineEnding.
			anExamplesReportResult runtimeStatisticsDiffReport fullTextualContent 
				linesDo: [ :aLine |
					NonInteractiveTranscript stdout 
						tab;
						<< aLine;
						<< OSPlatform current lineEnding ] ].
]

{ #category : #private }
GtExamplesCommandLineHandler >> installFlushChangesFileError [
	| aLink |

	aLink := MetaLink new 
		metaObject: (self class environment at: #GtPharoFlushChangesFileSignal ifAbsent: [ ^ self ]);
		selector: #signalIfOutsideModifier:;
		arguments: #(receiver).
		
	(SourceFileArray>>#flushChangesFile) ast link: aLink.
	
	(SourceFileBufferedReadWriteStream>>#close) ast link: aLink.
	(SourceFileBufferedReadWriteStream>>#flush) ast link: aLink.
	(SourceFileBufferedReadWriteStream class>>#on:) ast link: aLink.
	
	(BinaryFileStream>>#close) ast link: aLink
]

{ #category : #private }
GtExamplesCommandLineHandler >> installFlushChangesFileReporter [
	| aLink |
	aLink := MetaLink new 
		metaObject: (self class environment at: #GtPharoFlushChangesFileSignal ifAbsent: [ ^ self ]);
		selector: #emitIfOutsideModifier.
		
	(SourceFileArray>>#flushChangesFile) ast link: aLink
]

{ #category : #accessing }
GtExamplesCommandLineHandler >> packages [
	| packages |
	
	packages := Set new.
	self arguments 
		reject: [ :arg| arg beginsWith: '-']
		thenDo: [ :arg| self addPackagesMatching: arg to: packages ].
				
	^ packages difference: self packagesToSkip
]

{ #category : #accessing }
GtExamplesCommandLineHandler >> packagesToSkip [
	| packagesToSkip |
	
	packagesToSkip := Set new.
	self commandLine optionAt: 'skip-packages' ifPresent: [ :aListOfPackages |
		| unquotedListOfPackages |
		
		unquotedListOfPackages := aListOfPackages
			trimBoth: [ :char | #($' $") includes: char ].
		
		(unquotedListOfPackages splitOn: ',') do: [ :eachPackageName |
			self addPackagesMatching: eachPackageName trimBoth to: packagesToSkip ] ].

	^ packagesToSkip
]

{ #category : #'private - quitting' }
GtExamplesCommandLineHandler >> quitAfterRun [
	"Quit with a success status, whether or not a windowing event loop is running.

	${method:CommandLineHandler>>#quit}$ answers ${method:CommandLineHandler>>#exitSuccess}$, which signals
	an `Exit` in this process. That is enough headless, but it does not stop a running windowing event
	loop: the examples finish, the reports are written, and the process stays alive with a window open
	until something kills it. On CI that means the stage hangs to its timeout rather than passing.

	So when a loop is running, postpone the quit onto the universe instead, which is what lets the loop
	shut itself down. ${method:BlParallelUniverse>>#postpone:}$ exists for exactly this, and
	`gt-installer start` already quits this way.

	The image must not be saved: an examples run is throwaway, and ${method:SmalltalkImage>>#exitSuccess}$
	discards changes by design."
	self hasWindowingEventLoop ifFalse: [ ^ self quit ].

	BlHost pickHost universe postpone: [ Smalltalk exitSuccess ]
]

{ #category : #private }
GtExamplesCommandLineHandler >> runPackages [
	| packages examplesReportResult runBlock |
	
	packages := self sortedPackageNamesToRun.
	self inform: 'Running examples in ', packages size asString, ' packages'.
	
	runBlock := [ [ examplesReportResult := (self basicRunExamplesInPackages: packages) ]
		on: Error
		do: [ :ex | 
			self inform: 'Exiting runBlock abnormally'.
			self inform: ex printString.
			
			Smalltalk
				logError: ex printString
				inContext: ex signalerContext ] ].

	"we should detect places that trigger changes file flushing without synchronisation"	
	"self installFlushChangesFileError."

	(self hasOption: 'verbose')
		ifTrue: [
			(CustomStreamLogger with: (ZnNewLineWriterStream on: Stdio stdout))
				runFor: GtExamplesReportSignal
				during: runBlock ]
		ifFalse: runBlock.

	examplesReportResult ifNil:
		[ self inform: 'No report result - should have Exiting runBlock abnormally'.
		^ nil ].

	examplesReportResult exampleResults
		ifNotNil: [ self informResults: examplesReportResult ].
		
	^ examplesReportResult exampleResults
]

{ #category : #private }
GtExamplesCommandLineHandler >> runPackagesInUI [
	| packages results |
	packages := self sortedPackageNamesToRun.
	results := (GtExamplesHudsonReport runPackages: packages) select: #notNil.				
	^ results
]

{ #category : #private }
GtExamplesCommandLineHandler >> runWithMessageTally: aBlock [
	| result messageTally |
	
	(self hasOption: 'enable-message-tally') ifFalse: [
		^ aBlock value ].
	
	messageTally := MessageTally new.
	messageTally reportOtherProcesses: true.
	messageTally 
		spyAllEvery: MessageTally defaultPollPeriod
		on: [
			result := aBlock value ].
	
	('messageTally-{1}-full.txt' 
		format: {self class checksLabel}) asFileReference 
			writeStreamDo: [ :aStream |
				messageTally report: aStream ].
	('messageTally-{1}-filtered.txt' 
		format: {self class checksLabel}) asFileReference 
			writeStreamDo: [ :aStream |
				(messageTally applyFilter: GtRecursionSummaryFilter  new) 
					report: aStream ].
	
	^ result
]

{ #category : #private }
GtExamplesCommandLineHandler >> runWithVmStatistics: aBlock [
	| diffReport exampleResults |
	
	(self hasOption: 'verbose') ifFalse: [
		exampleResults := aBlock value.
		^ GtExamplesReportResult new 
			exampleResults: (exampleResults select: #notNil) ].
	
	diffReport := GtVmRuntimeStatisticsDiffReport new.
	diffReport label: self class checksLabel capitalized pluralize, ' Report'.
	diffReport recordSourceReport.

	exampleResults := aBlock value.
	
	diffReport recordTargetReport.
	
	^ GtExamplesReportResult new 
		exampleResults: (exampleResults select: #notNil);
		runtimeStatisticsDiffReport: diffReport
]

{ #category : #accessing }
GtExamplesCommandLineHandler >> sortedPackageNamesToRun [
	^ self packages sorted: [ :a :b | a < b ]
]
