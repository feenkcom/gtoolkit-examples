private
inspectProblems: aBlock builder: aBuilder
	(lastItem := aBuilder item: 'Inspect problems')
		parent: #gte;
		action: [ self examples: aBlock select: [ :each | each hasProblems ] collect: [ :each | each problems ] ];
		icon: (Smalltalk ui icons iconNamed: #smallError)