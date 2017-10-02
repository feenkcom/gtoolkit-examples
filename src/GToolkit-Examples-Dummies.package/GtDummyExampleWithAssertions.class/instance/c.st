examples
c
	<gtExample>
	| a b |
	a := self a.
	b := self b.
	self assert: a = b.
	^ a & b