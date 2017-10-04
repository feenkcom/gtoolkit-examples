instance creation
fromMetaClassNamed: aString
	^ self new 
		theClass: nil;
		theClassName: aString asString;
		meta: true;
		yourself