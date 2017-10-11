public
result
	self do: [ result := self value ] 
		on: GtExampleResult signalableExceptions
		do: [ :anException | 
			result := (self newResultFor: self example) 
				returnValue: nil;
				exampleException: anException ].
	^ result