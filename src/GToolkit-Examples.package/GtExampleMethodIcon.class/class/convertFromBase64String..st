converters
convertFromBase64String: aString
	^ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: aString readStream)