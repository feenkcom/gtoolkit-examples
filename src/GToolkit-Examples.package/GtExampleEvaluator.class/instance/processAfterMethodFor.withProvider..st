private
processAfterMethodFor: anExample withProvider: aProvider
	anExample after ifNil: [ ^ self ].
	anExample after method
		valueWithReceiver: aProvider
		arguments: #()