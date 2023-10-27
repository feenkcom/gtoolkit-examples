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
		^ self exitFailure: 'There was an Error running examples' ].
	
	(self hasOption: 'save')
		ifTrue: [ Smalltalk saveSession ].
		
	((self hasOption: 'fail-on-no-tests-executed') 
		and: [ theResults allSatisfy: #hasNoExecutedTestCases ])
		ifTrue: [ ^ self exitFailure: 'No tests were executed!' ].
	
	((self hasOption: 'fail-on-failure') 
		and: [ theResults anySatisfy: #hasFailuresOrErrors ])
		ifTrue: [ ^ self exitFailure: 'Tests do not pass!' ].

	((self hasOption: 'fail-on-error') 
		and: [ theResults anySatisfy: #hasErrors ])
		ifTrue: [ ^ self exitFailure: 'Tests do not pass!' ].
	
	(self hasOption: 'no-quit')
		ifFalse: [ self quit ]
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
	((RPackage organizer includesPackageNamed: aString) 
		and: [ (RPackage organizer packageNamed: aString) definedClasses notEmpty ])
		ifTrue: [ aSet add: aString ]
]

{ #category : #accessing }
GtExamplesCommandLineHandler >> addPackagesMatchingGlob: aGlobString to: aSet [
	RPackage organizer packageNames do: [ :packageName|
		(aGlobString match: packageName)
			ifTrue: [ aSet add: packageName ]]
]

{ #category : #accessing }
GtExamplesCommandLineHandler >> addPackagesMatchingRegex: aRegex to: aSet [
	RPackage organizer packageNames do: [ :packageName|
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

{ #category : #private }
GtExamplesCommandLineHandler >> inform: aString [
	self stdout 
		<< aString
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
				results sum: #totalCount.
				results sum: #executedCount.
				results sum: #passingCount.
				results sum: #failureCount.
				results sum: #errorCount.
				results sum: #skippedCount });
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
	
	(Categorizer>>#classify:under:suppressIfDefault:) ast link: aLink.
	(Categorizer>>#removeCategory:) ast link: aLink.
	(Categorizer>>#addCategory:before:) ast link: aLink.
	(Categorizer>>#renameCategory:toBe:) ast link: aLink.
	(Categorizer>>#removeEmptyCategories) ast link: aLink.
	(Categorizer>>#removeElement:) ast link: aLink.
	(Categorizer>>#changeFromCategorySpecs:) ast link: aLink.
	(Categorizer>>#categories:) ast link: aLink.
	(Categorizer>>#setDefaultList:) ast link: aLink.
	
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
			NonInteractiveTranscriptLogger instance
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
