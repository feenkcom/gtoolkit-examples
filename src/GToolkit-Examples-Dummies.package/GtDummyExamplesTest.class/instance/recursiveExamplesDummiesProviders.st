accessing
recursiveExamplesDummiesProviders
	^ GtAbstractDummyExamples withAllSubclasses select: [ :each | 
		each isAbstract not 
			and: [ each isExpectedRecursion ] ]