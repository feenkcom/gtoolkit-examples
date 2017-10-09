printing
statusTextWithResultValueClassName
	| status resultOrErrorClassName |
	status := self statusText.
	resultOrErrorClassName := self resultOrErrorName.
	resultOrErrorClassName ifNotNil: [ status := status , ': ' , resultOrErrorClassName ].
	^ status