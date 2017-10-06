converters
convertFromByteArray: aByteArray extent: anExtent depth: aDepth offset: anOffset
	^ Form
		extent: anExtent
		depth: aDepth
		fromArray: aByteArray 
		offset: anOffset