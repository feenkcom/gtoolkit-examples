Extension { #name : #RBMessageNode }

{ #category : #'*GToolkit-Examples-Extensions' }
RBMessageNode class >> gtExampleAddition [
	<gtExample>
	^ RBMessageNode 
				receiver: (RBVariableNode named: 'self')
				selector: #+
				arguments: (Array with: (RBLiteralNode value: 0))
]
