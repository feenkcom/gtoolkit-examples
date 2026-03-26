Extension { #name : #OCProgramNode }

{ #category : #'*GToolkit-Examples-Extensions' }
OCProgramNode class >> gtExampleRBProgramNode [
	<gtExample>
	<label: 'RBProgramNode'>
	
	^ (GtInspector class >> #gtExtensionsFor:) parseTree
]
