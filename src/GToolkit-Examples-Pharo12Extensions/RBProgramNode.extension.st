Extension { #name : #RBProgramNode }

{ #category : #'*GToolkit-Examples-Pharo12Extensions' }
RBProgramNode class >> gtExampleRBProgramNode [
	<gtExample>
	<label: 'RBProgramNode'>
	
	^ (GtInspector class >> #gtExtensionsFor:) parseTree
]
