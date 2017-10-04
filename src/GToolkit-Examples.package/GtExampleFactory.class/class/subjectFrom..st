subjects
subjectFrom: anObject
	^ anObject isClass
		ifTrue: [ self classSubjectFrom: anObject] 
		ifFalse: [ self instanceSubjectFromObject: anObject ]