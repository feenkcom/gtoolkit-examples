accessing-dynamic
signalableExceptions
	^ self exceptions copyWithAll: { 
		Halt. 
		"Error."  "Catching here Error will capture many errors that should not be captured"
		Exit. 
		UnhandledError. 
		TestFailure. 
		Deprecation. }