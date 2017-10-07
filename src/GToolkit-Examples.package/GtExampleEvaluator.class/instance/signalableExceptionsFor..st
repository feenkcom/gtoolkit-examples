accessing
signalableExceptionsFor: anExample
	"I return the set of exceptions that are captured by the evaluator."
	^ anExample exceptions copyWithAll: { 
		Halt. 
		Error. 
		Exit. 
		UnhandledError. 
		TestFailure. 
		Deprecation. }