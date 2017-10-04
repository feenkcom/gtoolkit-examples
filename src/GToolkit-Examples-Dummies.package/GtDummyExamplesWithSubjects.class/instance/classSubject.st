examples
classSubject
	<gtExample>
	<subjectClass: 'GtExample'>
	
	self assert: self gtExampleContext example subjects first class = GtExampleClassSubject.
	self assert: self gtExampleContext example subjects first theClassName = 'GtExample'.
	self assert: self gtExampleContext example subjects first theClass = GtExample.
	self assert: self gtExampleContext example subjects first exists.
	
	^ 0