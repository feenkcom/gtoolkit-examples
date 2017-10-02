examples
b
	<gtExample>
	|a c|
	a := self a.
	c := self c.
	self assert: self gtExampleContext notNil.
	self assert: a == self gtExampleContext.
	self assert: c == self gtExampleContext.
	self assert: (self gtExampleContext at: #a) = #a.
	self assert: (self gtExampleContext at: #c) = #c.