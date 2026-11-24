"
I am a {{gtClass:GtExamplesHudsonReport}} that writes to temporary files instead of the shared ones.

I exist because a report cannot safely be run from inside an example otherwise:

- {{gtMethod:GtExamplesHudsonReport>>#progressFileName}} answers the single shared `progress-examples.log`, and {{gtMethod:GtExamplesTestingHudsonReport>>#ensureProgressFile}} deletes that file before opening it. An example running a plain report would therefore destroy the progress log of the very run it is part of.
- {{gtMethod:GtExamplesHudsonReport>>#resultsFileName}} answers a name ending in `-Examples.xml`, which the CI job collects as JUnit test results. An example running a plain report would leave behind a file that Jenkins ingests as if it were a real report.

I override both names with `.tmp` names that match neither pattern, and {{gtMethod:GtExamplesHudsonReportWithTemporaryFiles>>#deleteFiles}} removes them again, so {{gtClass:GtExamplesHudsonReportExamples}} can exercise the real {{gtMethod:GtExamplesTestingHudsonReport>>#run}} lifecycle without either side effect.
"
Class {
	#name : #GtExamplesHudsonReportWithTemporaryFiles,
	#superclass : #GtExamplesHudsonReport,
	#instVars : [
		'temporaryFilePrefix'
	],
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #cleanup }
GtExamplesHudsonReportWithTemporaryFiles >> deleteFiles [
	"Remove both temporary files. File>>delete tolerates a missing file, as #ensureResultsFile relies on."

	(File named: self resultsFileName) delete.
	(File named: self progressFileName) delete
]

{ #category : #initialization }
GtExamplesHudsonReportWithTemporaryFiles >> initialize [
	super initialize.
	temporaryFilePrefix := 'gt-examples-hudson-report-example-' , UUID new asString
]

{ #category : #accessing }
GtExamplesHudsonReportWithTemporaryFiles >> progressFileName [
	^ temporaryFilePrefix , '-progress.tmp'
]

{ #category : #accessing }
GtExamplesHudsonReportWithTemporaryFiles >> resultsFileName [
	^ temporaryFilePrefix , '-results.tmp'
]
