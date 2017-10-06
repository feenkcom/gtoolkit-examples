PRAGMA-SELECTORS
iconSelectorBase64: aSelector
	<gtExamplePragma>
	<description: 'Attach an icon to this example. The icon form is described by the base64 string returned by the given selector'>
	
	form := (self methodResolverClass resolve: GtExampleMethodIcon example: self selector: aSelector)
		converter: #convertFromBase64String:;
		yourself