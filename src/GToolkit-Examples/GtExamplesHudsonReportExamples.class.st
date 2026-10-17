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
