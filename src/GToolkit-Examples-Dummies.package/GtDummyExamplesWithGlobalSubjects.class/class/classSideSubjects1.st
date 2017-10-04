examples
classSideSubjects1
	<gtExample>
	
	self assert: self gtExampleContext example subjects first class equals: GtExampleClassSubject.
	self assert: self gtExampleContext example subjects first theClassName equals: 'GtExample'.
	self assert: self gtExampleContext example subjects first theClass equals: GtExample.
	self assert: self gtExampleContext example subjects first exists.
	
	^ 0