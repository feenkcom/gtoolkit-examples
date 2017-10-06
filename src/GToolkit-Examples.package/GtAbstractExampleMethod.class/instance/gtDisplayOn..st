ui
gtDisplayOn: aStream
	aStream 
		nextPutAll: self methodClassName asString; 
		nextPutAll: ' >> #'; 
		nextPutAll: self selector asString.
		
	self gtDisplayValidityOn: aStream