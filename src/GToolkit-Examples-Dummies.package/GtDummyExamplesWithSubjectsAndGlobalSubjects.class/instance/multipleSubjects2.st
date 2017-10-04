examples
multipleSubjects2
	<gtExample>
	<subject: 'GtExample'> 
	<subjectClass: 'Object'> " overlap "
	<subjectClass: #Array> " overlap "
	
	self assert: self gtExampleContext example subjects size equals: 3.
	self assert: (self gtExampleContext example subjects select: [ :each | each exists ]) size equals: 3.
	
	^ 0