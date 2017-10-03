accessing
dependenciesFor: anExample
	| dependencies traversal |
	dependencies := OrderedCollection new.
	traversal := anExample traverser
		context: self context; 
		action: [ :anotherExample | 
			(dependencies includes: anotherExample) ifFalse: [ 
				dependencies add: anotherExample ] ];
		yourself.
	[ 
	  traversal value.
	  ^ dependencies 
	] on: Error
	  do: [ :anError | 
		(GTExampleUnexpectedExceptionRaised new 
			unexpectedError: anError;
			yourself) signal  ].