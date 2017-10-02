private
processAfterMethodFor: anExample
	| provider |
	anExample after ifNil: [ ^ self ].
	provider := self providerFor: anExample after.
	anExample after method
		valueWithReceiver: provider
		arguments: #().
	providers removeKey: provider class