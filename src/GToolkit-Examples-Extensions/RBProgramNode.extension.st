Extension { #name : #RBProgramNode }

{ #category : #'*GToolkit-Examples-Extensions' }
RBProgramNode class >> gtExampleRBProgramNode [
	<gtExample>
	<label: 'RBProgramNode'>
	
	^ (GtInspector class >> #gtExtensionsFor:) parseTree
]
