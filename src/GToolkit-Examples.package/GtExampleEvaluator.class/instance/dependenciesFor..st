accessing
dependenciesFor: anExample
	| dependencies traversal |
	dependencies := OrderedCollection new.
	traversal := anExample traverser
		action: [ :anotherExample | 
			(dependencies includes: anotherExample) ifFalse: [ 
				dependencies add: anotherExample ] ];
		yourself.
	[ 
	  traversal value.
	  ^ dependencies 
	] on: Error
	  do: [ :anError | 
		(GtExampleUnexpectedExceptionRaised new 
			unexpectedError: anError;
			yourself) signal  ].