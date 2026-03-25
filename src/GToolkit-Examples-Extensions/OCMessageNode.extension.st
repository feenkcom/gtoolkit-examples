Extension { #name : #OCMessageNode }

{ #category : #'*GToolkit-Examples-Extensions' }
OCMessageNode class >> gtExampleAddition [
	<gtExample>
	^ RBMessageNode 
				receiver: (RBVariableNode named: 'self')
				selector: #+
				arguments: (Array with: (RBLiteralNode value: 0))
]
