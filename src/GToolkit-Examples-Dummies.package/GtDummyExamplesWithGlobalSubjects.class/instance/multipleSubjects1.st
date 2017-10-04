examples
multipleSubjects1
	<gtExample>
	
	self assert: self gtExampleContext example subjects size = 3.
	self assert: (self gtExampleContext example subjects allSatisfy: [ :each | each exists ]).
	self gtExamplesSubjects do: [ :each |
		self assert: (self gtExampleContext example hasSubject: (self class gtExamplesFactoryClass subjectFrom: each)) ].
	
	^ 0