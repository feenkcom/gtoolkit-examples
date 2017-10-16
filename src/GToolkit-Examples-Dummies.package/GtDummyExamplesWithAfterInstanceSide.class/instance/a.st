examples
a
	<gtExample>
	<after: #afterA>
	" START -> C B A -> afterA -> afterB -> afterC -> END "
	
	self b.
	
	self assert: (self gtExampleContext includesKey: #c).
	self assert: (self gtExampleContext includesKey: #c2).
	self assert: (self gtExampleContext includesKey: #b).
	self assert: (self gtExampleContext includesKey: #b2).
	
	self gtExampleContext at: #a put: #a.
	self gtExampleContext at: #a2 put: #a2.
	
	self gtExampleContext at: #self ifAbsentPut: [self].
	
	^ self gtExampleContext