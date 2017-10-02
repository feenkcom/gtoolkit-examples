accessing
allExamplesDummiesProviders
	^ GTAbstractDummyExamples withAllSubclasses select: [ :each | 
		each isAbstract not ]