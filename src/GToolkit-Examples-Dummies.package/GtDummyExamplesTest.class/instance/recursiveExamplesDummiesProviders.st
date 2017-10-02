accessing
recursiveExamplesDummiesProviders
	^ GTAbstractDummyExamples withAllSubclasses select: [ :each | 
		each isAbstract not 
			and: [ each isExpectedRecursion ] ]