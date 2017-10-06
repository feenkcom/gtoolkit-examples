printing
statusTextWithResultValueClassName
	| status resultOrErrorClassName |
	status := self statusText.
	resultOrErrorClassName := self resultOrErrorClassName.
	resultOrErrorClassName ifNotNil: [ status := status , ': ' , resultOrErrorClassName ].
	^ status