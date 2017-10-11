exceptions
signalableExceptions
	"I return the set of exceptions that are captured by the evaluator and cause an example to fail."
	^ ExceptionSet new ,
		Halt ,
		Error ,
		Exit ,
		UnhandledError,
		TestFailure,
		Deprecation