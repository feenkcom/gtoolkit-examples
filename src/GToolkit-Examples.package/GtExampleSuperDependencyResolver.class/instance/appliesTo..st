testing
appliesTo: anASTNode
	^ anASTNode isMessage and: [ anASTNode isSuperSend ]