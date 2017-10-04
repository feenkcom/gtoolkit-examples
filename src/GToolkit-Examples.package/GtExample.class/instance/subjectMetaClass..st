PRAGMA-SELECTORS
subjectMetaClass: aClassOrClassName
	<gtExamplePragma>
	<description: 'Add a meta-class-subject to the example'>
	
	self addSubject: (self classResolverClass resolve: GtExampleClassSubject example: self className: aClassOrClassName meta: true)