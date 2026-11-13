"
I am a {{gtClass:GtExamplesHudsonReportWithTemporaryFiles}} whose preparation for the next attempt of a failed example is slower than the time limit of that example.
I exist because {{gtClass:GtExamplesHudsonReportExamples}} must show that this preparation runs after the failed attempt has unwound, when the watchdog of the {{gtClass:TestExecutionEnvironment}} no longer signals {{gtClass:TestTookTooMuchTime}}.
{{gtMethod:GtExamplesHudsonReportWithSlowRetry>>#prepareForRetryOf:}} waits {{gtMethod:GtExamplesHudsonReportWithSlowRetry>>#retryDelay}} instead of collecting garbage and waiting three seconds, and {{gtMethod:GtExamplesHudsonReportWithSlowRetry>>#testCasesToRun}} also runs examples marked as `<noTest>`, because examples that are designed to fail are marked so.
"
Class {
	#name : #GtExamplesHudsonReportWithSlowRetry,
	#superclass : #GtExamplesHudsonReportWithTemporaryFiles,
	#category : #'GToolkit-Examples-Testing'
}

{ #category : #running }
GtExamplesHudsonReportWithSlowRetry >> prepareForRetryOf: anExample [
	"Take longer than the time limit of anExample, so that a running watchdog would signal another TestTookTooMuchTime"

	self retryDelay wait
]

{ #category : #accessing }
GtExamplesHudsonReportWithSlowRetry >> retryDelay [
	^ 500 milliSeconds
]

{ #category : #accessing }
GtExamplesHudsonReportWithSlowRetry >> testCasesToRun [
	"Also run examples marked as <noTest>: examples designed to fail are marked so"

	^ self testCases
]
