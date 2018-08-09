accessing
returnValueOrExampleException
	^ self hasException 
		ifTrue: [ self exampleException ] 
		ifFalse: [ self returnValue ]