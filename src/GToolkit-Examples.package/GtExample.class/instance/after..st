PRAGMA-SELECTORS
after: aSelector
	<gtExamplePragma>
	<description: 'A method, implemented by the given selector, to be performed after this example has run ~ similar but not identical to teardown of sunit'>
	
	after := self methodResolverClass resolve: GTExampleMethodAfter example: self selector: aSelector