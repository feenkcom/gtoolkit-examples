"
I cover the lifecycle of {{gtClass:GtExamplesTestingHudsonReport}}, in particular that {{gtMethod:GtExamplesTestingHudsonReport>>#tearDown}} is idempotent.

{{gtMethod:GtExamplesTestingHudsonReport>>#run}} calls `tearDown` from an `ensure:` block, so it runs on any non-local unwind, including a {{gtMethod:Process>>#terminate}} triggered by an example. {{gtMethod:GtExamplesTestingHudsonReport>>#end}} writes the closing XML and then closes both streams, so a second tear down used to write to a closed stream and raise a `FileWriteError`. That error escaped `run` and failed an entire package run rather than just one example class.

I use {{gtClass:GtExamplesHudsonReportWithTemporaryFiles}} so that running a real report here has no effect on the surrounding run.
"
Class {
	#name : #GtExamplesHudsonReportExamples,
	#superclass : #Object,
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #'examples - retry' }
GtExamplesHudsonReportExamples >> exampleExceedingItsTimeLimit [
	"This example is a noTest as it is designed to fail: it always runs out of time"

	<gtExample>
	<timeLimit: 200>
	<noTest>
	1 second wait
]

{ #category : #examples }
GtExamplesHudsonReportExamples >> report [
	"A report with no example to run, writing to temporary files."

	<gtExample>
	<return: #GtExamplesHudsonReportWithTemporaryFiles>

	^ GtExamplesHudsonReportWithTemporaryFiles new
		initializeWithTestCases: #();
		reportName: 'GtExamplesHudsonReportExamples';
		yourself
]

{ #category : #examples }
GtExamplesHudsonReportExamples >> reportWritesAndClosesItsFile [
	"The normal lifecycle still produces a complete XML document."

	<gtExample>
	<return: #GtExamplesHudsonReportWithTemporaryFiles>
	| aReport contents |

	aReport := self report.
	[ aReport run.
	contents := aReport resultsFileName asFileReference contents ]
		ensure: [ aReport deleteFiles ].
	self assert: (contents includesSubstring: '<testsuite ').
	self assert: (contents endsWith: '</testsuite>').
	^ aReport
]

{ #category : #'examples - retry' }
GtExamplesHudsonReportExamples >> slowRetryOfTimedOutExampleIsReported [
	"An example runs out of time in every attempt, and the preparation for the next attempt takes longer than its time limit.
	The report must still finish and report the example as one error with a stack for each attempt.
	The preparation must run after the failed attempt has unwound. Otherwise the watchdog signals another
	TestTookTooMuchTime inside the retry handler, which escapes the report and aborts the whole examples run."

	<gtExample>
	<return: #GtExamplesHudsonReportWithSlowRetry>
	| aReport contents |
	aReport := GtExamplesHudsonReportWithSlowRetry new
			initializeWithTestCases: {(self class >> #exampleExceedingItsTimeLimit) gtExample};
			reportName: 'GtExamplesHudsonReportExamples';
			yourself.
	[ aReport run.
	contents := aReport resultsFileName asFileReference contents ]
		ensure: [ aReport deleteFiles ].

	self assert: aReport errorCount equals: 1.
	self assert: aReport failureCount equals: 0.
	self assert: (contents includesSubstring: '<error type="TestTookTooMuchTime"').
	self assert: (contents includesSubstring: 'Stack 3').
	self assert: (contents endsWith: '</testsuite>').
	^ aReport
]

{ #category : #examples }
GtExamplesHudsonReportExamples >> tearDownIsIdempotent [
	"A second and third tear down must be a no-op rather than a write to a closed stream.
	#run calls #tearDown from an ensure: block, so an example that terminates the process can unwind
	through it more than once."

	<gtExample>
	<return: #GtExamplesHudsonReportWithTemporaryFiles>
	| aReport contents |

	aReport := self report.
	[ aReport run.
	aReport tearDown.
	aReport tearDown.
	contents := aReport resultsFileName asFileReference contents ]
		ensure: [ aReport deleteFiles ].
	self assert: (contents endsWith: '</testsuite>').
	^ aReport
]

{ #category : #examples }
GtExamplesHudsonReportExamples >> tearDownWithoutSetUpIsSafe [
	"Tearing down a report that was never set up must not raise."

	<gtExample>
	<return: #GtExamplesHudsonReportWithTemporaryFiles>
	| aReport |

	aReport := self report.
	aReport tearDown.
	^ aReport
]
