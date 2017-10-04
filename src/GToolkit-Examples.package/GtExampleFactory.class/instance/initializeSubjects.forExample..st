private-init
initializeSubjects: aCollection forExample: aGTExample
	aCollection isEmptyOrNil ifTrue: [ ^ self ].
	
	aCollection do: [ :subject | 
		[ aGTExample addSubject: (self class subjectFrom: subject) ]
			on:Error
			do: [ :exception | 
				aGTExample addProblem: (GtExampleSubjectError new 
					example: aGTExample;
					subject: subject;
					signaledException: exception;
					yourself) ] ] 