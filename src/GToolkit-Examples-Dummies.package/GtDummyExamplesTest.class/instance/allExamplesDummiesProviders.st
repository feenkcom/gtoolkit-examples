accessing
allExamplesDummiesProviders
	^ GtAbstractDummyExamples withAllSubclasses select: [ :each | 
		each isAbstract not ]