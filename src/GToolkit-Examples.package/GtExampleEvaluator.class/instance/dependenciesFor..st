accessing
dependenciesFor: anExample
	| dependencies traversal |
	dependencies := OrderedCollection new.
	traversal := anExample traverser
		action: [ :anotherExample | 
			(dependencies includes: anotherExample) ifFalse: [ 
				dependencies add: anotherExample ] ];
		yourself.
	 traversal value.
	(dependencies anySatisfy: [ :anotherExample | anotherExample isValid not ])
		ifTrue: [ ^ self handleDependencyErrorFor: anExample ].
	^ dependencies