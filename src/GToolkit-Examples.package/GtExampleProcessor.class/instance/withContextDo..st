private
withContextDo: aBlock
	^ GtCurrentExampleContext use: context during: aBlock