private
buildSeparator
	lastItem ifNil: [ ^ self ].
	lastItem withSeparatorAfter