*GToolkit-Examples-Core
signaledBy: anException
	(anException isNil and: [ exceptions isEmptyOrNil not ]) ifTrue: [ 
		^ (GtExampleExpectedExceptionNotRaised new 
			expectedError: self;
			exception: anException;
			yourself) signal ].
	(anException notNil and: [ (exceptions includes: anException class) not ]) ifTrue: [ 
		^ (GtExampleUnexpectedExceptionRaised new
			unexpectedError: anException;
			yourself) signal ]