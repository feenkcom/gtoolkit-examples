testing
appliesTo: anASTNode
	
	((anASTNode isKindOf: RBVariableNode) and: [ 
		anASTNode isGlobal and: [ 
			Smalltalk hasClassNamed: anASTNode name ] ])
				ifFalse: [ ^ false ].
	^ anASTNode parent notNil and: [ 
		anASTNode parent isMessage and: [ 
			(anASTNode parent selector = 'new') and:[ 
				anASTNode parent parent notNil and: [ 
					anASTNode parent parent isMessage ] ] ] ]