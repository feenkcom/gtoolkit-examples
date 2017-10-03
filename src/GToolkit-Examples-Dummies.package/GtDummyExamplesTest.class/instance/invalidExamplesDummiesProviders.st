accessing
invalidExamplesDummiesProviders
	^ GtAbstractDummyExamples withAllSubclasses select: [ :each | 
		each isAbstract not 
			and: [ each isExpectedFailure ] ]