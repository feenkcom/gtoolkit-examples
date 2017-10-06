initialization
initialize
	super initialize.
	executionTime := 0 asDuration.
	examplesPosition := examplesFailures := examplesErrors := 0.
	progressFile := StandardFileStream forceNewFileNamed: 'progress.log'
	