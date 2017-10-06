instance creation
fromByteArray: aByteArray
	^ self new
		converter: #convertFromByteArray:;
		arguments: { aByteArray };
		yourself