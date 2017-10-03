private
newResultFor: anExample
	^ GtExampleResult new 
		example: anExample;
		context: self context;
		yourself.