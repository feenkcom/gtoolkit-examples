PRAGMA-SELECTORS
subjectClass: aClassOrClassName
	<gtExamplePragma>
	<description: 'Add a class-subject to the example'>
	
	self addSubject: (self classResolverClass resolve: GtExampleClassSubject example: self className: aClassOrClassName meta: false)