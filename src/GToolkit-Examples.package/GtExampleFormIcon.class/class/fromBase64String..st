instance creation
fromBase64String: aString
	^ self new
		converter: #convertFromBase64String:;
		arguments: { aString };
		yourself