PRAGMA-SELECTORS
iconClass: aClassOrClassName selector: aSelector
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The method described by the given class and selector must return an icon form'>
	
	form := self methodResolverClass resolve: GtExampleMethodIcon example: self className: aClassOrClassName meta: false selector: aSelector