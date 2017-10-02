instance creation
fromClassNamed: aString selector: aSelector
	^ self new 
		methodClass: nil;
		methodClassName: aString asString;
		meta: false;
		selector: aSelector;
		yourself