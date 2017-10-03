private
handleRecursionErrorFor: anExample
	^ (GtExampleRecursionDetected new 
		example: self example;
		resolved: processing;
		next: anExample;
		yourself) signal