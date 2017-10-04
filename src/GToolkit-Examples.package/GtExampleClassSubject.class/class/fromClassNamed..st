instance creation
fromClassNamed: aString
	^ self new 
		theClass: nil;
		theClassName: aString asString;
		meta: false;
		yourself