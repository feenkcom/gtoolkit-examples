private
basicProcess: anExample
	| currentResult dependencies |
	dependencies := self dependenciesFor: anExample.
	currentResult := self newResultFor: anExample.
	context example: anExample.
	
	[ currentResult returnValue: (self primitiveProcessExample: anExample) ] 
		ensure: [ 
			self processAfter: anExample withDependencies: dependencies ].
	
	^ currentResult