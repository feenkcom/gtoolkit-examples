private
process: anExample withArguments: aBlock
	| currentResult dependencies |
	currentResult := self newResultFor: anExample.
	dependencies := self dependenciesFor: anExample.
	(dependencies anySatisfy: [ :anotherExample | anotherExample isValid not ])
		ifTrue: [ ^ self handleDependencyErrorFor: anExample ].
	self 
		do: [ 
			currentResult returnValue: (self 
				primitiveProcessExample: anExample) ]
		on: anExample signalableExceptions
		do: [ :exception | currentResult expectedError: exception ].
	
	self
		do: [ self processAfter: anExample withDependencies: dependencies ]
		on: anExample signalableExceptions
		do: [ :exception | currentResult expectedError: exception ].
	anExample == self example ifTrue: [ result := currentResult ].
	anExample exceptions signaledBy: currentResult expectedError.
	^ currentResult returnValue