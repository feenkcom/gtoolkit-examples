testing
appliesTo: anASTNode
	^ anASTNode isMessage and: [ anASTNode isSelfSend ]