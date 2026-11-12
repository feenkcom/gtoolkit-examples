Extension { #name : #TestExecutionService }

{ #category : #'*GToolkit-Examples-Core' }
TestExecutionService >> isEnabledInUnmanagedExampleRuns [
	"Answer whether I stay enabled when an example runs without the clean up of managed runs
	(see TestExecutionEnvironment>>#runUnmanagedExampleEvaluator:).
	Services manage and clean up after a test, which an unmanaged example run is not, so they are disabled by default.
	A service that should stay enabled answers true"

	^ false
]
