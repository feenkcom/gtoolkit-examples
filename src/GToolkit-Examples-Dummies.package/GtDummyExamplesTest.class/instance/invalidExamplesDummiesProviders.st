accessing
invalidExamplesDummiesProviders
	^ GTAbstractDummyExamples withAllSubclasses select: [ :each | 
		each isAbstract not 
			and: [ each isExpectedFailure ] ]