private
basicProcess: anExample
	| dependencies |
	dependencies := self dependenciesFor: anExample.
	(dependencies anySatisfy: [ :anotherExample | anotherExample isValid not ])
		ifTrue: [ ^ self handleDependencyErrorFor: anExample ].
	context example: anExample.
	
	self flag: 'This needs another pass'.
	[ self 
		do: [ 
			result returnValue: (self 
				primitiveProcessExample: anExample) ]
		on: (self signalableExceptionsFor: anExample)
		do: [ :exception | 
			(anExample exceptions gtIncludes: exception) ifTrue: [ 
				result expectedError: exception ]. "Only set this if it's an actual expected error"
			anExample exceptions signaledBy: exception. ] ] 
	ensure: [ 
		self
			do: [ self processAfter: anExample withDependencies: dependencies ]
			on: (self signalableExceptionsFor: anExample)
			do: [ :exception | 
				(anExample exceptions gtIncludes: exception) ifTrue: [ 
					result expectedError: exception ].
				anExample exceptions signaledBy: exception ] ].
		
	^ result returnValue