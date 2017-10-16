private
basicProcess: anExample
	| currentResult currentProvider dependencies |
	context example: anExample.

	dependencies := self dependenciesFor: anExample.
	currentResult := self newResultFor: anExample.
	currentProvider := anExample provider.
	
	[ currentResult returnValue: (self primitiveProcessExample: anExample withProvider: currentProvider) ] 
		ensure: [ 
			self processAfter: anExample withDependencies: dependencies andProvider: currentProvider ].
	
	^ currentResult